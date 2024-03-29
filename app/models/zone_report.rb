# == Schema Information
#
# Table name: zone_reports
#
#  id                 :uuid             not null, primary key
#  scheme_id          :uuid
#  bulk_meter_id      :uuid
#  zone_assignment_id :uuid
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  latitude           :float
#  longitude          :float
#  accuracy           :float
#  altitude           :float
#

class ZoneReport < ApplicationRecord
  belongs_to :scheme
  belongs_to :bulk_meter
  belongs_to :zone_assignment
  has_one :connection_info, dependent: :destroy
  has_one :anomally, dependent: :destroy
  has_one :meter_info, dependent: :destroy
  has_one :burst_and_lealage, dependent: :destroy
  has_one :report_further_action, dependent: :destroy
  has_many :zonepictures, dependent: :destroy

  validates_uniqueness_of :zone_assignment_id
  after_commit :update_assignment_stage, on: :create



  def self.myreports(userId)
    # byebug
    user = User.find_by(uid: userId)
    user.zone_reports.includes( :zone_assignment, :report_further_action)
  end

  def date
    self.created_at.strftime("%d/%m/%Y")
  end

  def reported_by
    self.zone_assignment.staff.full_names
  end

  def stage_name
      self.zone_assignment.stage.name
  end

  def image_url

		if Rails.env == "development" 
			root_url = "http://localhost:3000"
		else
			root_url = "https://wayspoint.com"
		end

    urls = []
    full_url = ""
    if self.zonepictures.first.present?
      # byebug
      url = self.zonepictures.first.url.present? ? self.zonepictures.first.url : nil
      full_url =  url !=nil ? root_url + url : ""
    end
    
			# urls << root_url + pic.image.url(:medium)
		
		return full_url	
  end

  def zone
    self.zone_assignment.zone
  end

  def report_type
    "zone"
  end

  def update_assignment_stage
    if (self.report_further_action.present?) 
      logger.debug "further action"	
  
      self.assignment.update_attributes(stage_id: Stage.where(name: "further action").first.id )
    else 
      logger.debug "complete"	
   
      self.zone_assignment.update_attributes(stage_id: Stage.where(name: "complete").first.id )
    end
  end
  
end
