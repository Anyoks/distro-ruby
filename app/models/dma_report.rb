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
			root_url = "https://distroapp.io"
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
  
end
