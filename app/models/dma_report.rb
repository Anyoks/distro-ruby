# == Schema Information
#
# Table name: dma_reports
#
#  id                :uuid             not null, primary key
#  scheme_id         :uuid
#  bulk_meter_id     :uuid
#  dma_assignment_id :uuid
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  latitude          :float
#  longitude         :float
#  accuracy          :float
#  altitude          :float
#  section           :string
#

class DmaReport < ApplicationRecord
  belongs_to :scheme
  # belongs_to :dma
  belongs_to :bulk_meter
  belongs_to :dma_assignment
  has_one :connection_info, dependent: :destroy
  has_one :anomally, dependent: :destroy
  has_one :meter_info, dependent: :destroy
  has_one :burst_and_lealage, dependent: :destroy
  has_one :report_further_action, dependent: :destroy
  has_many :dmapictures, dependent: :destroy


  validates_uniqueness_of :dma_assignment_id
   after_commit :update_assignment_stage, on: :create

   def self.myreports(userId)
    # byebug
    user = User.find_by(uid: userId)
    user.dma_reports.includes( :dma_assignment, :report_further_action)
  end

   def date
    self.created_at.strftime("%d/%m/%Y")
  end

  def reported_by
    self.dma_assignment.staff.full_names
  end 

  def stage_name
      self.dma_assignment.stage.name
  end

  def image_url

		if Rails.env == "development" 
			root_url = "http://localhost:3000"
		else
			root_url = "https://wayspoint.com"
		end

    urls = []
    full_url = ""
    if self.dmapictures.first.present?
      # byebug
      url = self.dmapictures.first.url.present? ? self.dmapictures.first.url : nil
      full_url =  url !=nil ? root_url + url : ""
    end
    
			# urls << root_url + pic.image.url(:medium)
		
		return full_url	
  end

  def dma
    self.dma_assignment.dma
  end

  def report_type
    "dma"
  end

  def update_assignment_stage
    if (self.report_further_action.present?) 
      logger.debug "further action"	
  
      self.assignment.update_attributes(stage_id: Stage.where(name: "further action").first.id )
    else 
      logger.debug "complete"	
   
      self.dma_assignment.update_attributes(stage_id: Stage.where(name: "complete").first.id )
    end
  end
  
end
