# == Schema Information
#
# Table name: account_reports
#
#  id            :uuid             not null, primary key
#  assignment_id :uuid
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  latitude      :float
#  longitude     :float
#  accuracy      :float
#  altitude      :float
#

class AccountReport < ApplicationRecord
  belongs_to :assignment

  has_one :connection_info, dependent: :destroy
  has_one :anomally, dependent: :destroy
  has_one :meter_info, dependent: :destroy
  has_one :report_further_action, dependent: :destroy

  validates_uniqueness_of :assignment_id
   after_commit :update_assignment_stage, on: :create

   def account
    self.assignment.account
  end

  def building_type
    self.account.account_details.building_type
  end
  
  def default_f_action
    if self.further_action_id == nil 
      self.further_action_id = FurtherAction.where(name:"none").first.id
    end
  end

  def current_reading
    unless self.meter_info.nil?
      self.meter_info.meter_reading
    end
  end

  def previous_reading
    self.account.account_details.latest_pervious_reading
  end

  def remarks
    if self.remark.name == "other"
      self.remark.other_remark.name
    else
      self.remark.name
    end
  end

  def account_status
    self.account.account_details.account_status
  end

  def update_assignment_stage
    if (self.report_further_action.present?) 
      logger.debug "further action"	
      # completed
      self.assignment.update_attributes(stage_id: Stage.where(name: "further action").first.id )
    else 
      logger.debug "complete"	
      # further action
      self.assignment.update_attributes(stage_id: Stage.where(name: "complete").first.id )
    end
    # elsif (self.completed == false )
    #   logger.debug "pending"	
    #   # if complete is false and no further action
    #   # pending 
    #   # == complete == false
    #   id =  Stage.where(name: "pending").first.id 
    #   logger.debug "pending id is #{id}"	
    #   self.assignment.update_attributes(stage_id: id)
    # end
  end

  def stage_name
      self.assignment.stage.name
  end

  def self.myreports(userId)
    # byebug
    user = User.find_by(uid: userId)
    user.account_reports.includes( :assignment, :report_further_action)
  end

  def complete
    self.completed.to_s
  end

  def image_url

		if Rails.env == "development" 
			root_url = "http://localhost:3000"
		else
			root_url = "https://wayspoint.com"
		end

    urls = []
    full_url = ""
    if self.pictures.first.present?
      # byebug
      url = self.pictures.first.url.present? ? self.pictures.first.url : nil
      full_url =  url !=nil ? root_url + url : ""
    end
    
			# urls << root_url + pic.image.url(:medium)
		
		return full_url	
	end
  
  def date
    self.created_at.strftime("%d/%m/%Y")
  end

  def reported_by
    self.assignment.staff.full_names
  end

  def report_type
    "account"
  end
end
