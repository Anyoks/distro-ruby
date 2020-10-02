# == Schema Information
#
# Table name: reports
#
#  id                :uuid             not null, primary key
#  completed         :boolean
#  comments          :string
#  further_action_id :uuid
#  assignment_id     :uuid             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  picture           :string
#  remark_id         :uuid             default("e6f350a6-1bb1-4e7b-921b-8dfcc5a534d2"), not null
#  meter_reading     :string
#  meter_serial      :string
#

class Report < ApplicationRecord

  attr_accessor :picture_data

  belongs_to :further_action
  belongs_to :remark
  belongs_to :assignment
  after_commit :update_assignment_stage, on: :create
  before_validation :default_f_action, on: :create
  has_many :pictures, dependent: :destroy

  # mount_uploader :picture, PictureUploader # using carrier wave


  # "assign"
  # "further action"
  # "pending"
  # "complete"

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
    self.meter_reading
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
    if (self.completed && self.further_action.name == 'none') 
      logger.debug "complete"	
      # completed
      self.assignment.update_attributes(stage_id: Stage.where(name:  "complete").first.id )
    elsif (self.completed && self.further_action.name != 'none')
      logger.debug "F action"	
      # further action
      self.assignment.update_attributes(stage_id: Stage.where(name: "further action").first.id )
    elsif (self.completed == false )
      logger.debug "pending"	
      # if complete is false and no further action
      # pending 
      # == complete == false
      id =  Stage.where(name: "pending").first.id 
      logger.debug "pending id is #{id}"	
      self.assignment.update_attributes(stage_id: id)
    end
  end

  def stage_name
      self.assignment.stage.name
  end

  def self.myreports(userId)
    # byebug
    user = User.find_by(uid: userId)
    user.reports.includes( :assignment, :further_action)
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
end
