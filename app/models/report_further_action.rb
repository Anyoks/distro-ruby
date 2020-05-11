class ReportFurtherAction < ApplicationRecord
  belongs_to :zoneReport, optional: true
  belongs_to :dmaReport, optional: true
  belongs_to :accountReport, optional: true
  
  has_many :report_further_action_pictures


  def image_url

		if Rails.env == "development" 
			root_url = "http://localhost:3000"
		else
			root_url = "https://distroapp.io"
		end

    urls = []
    full_url = ""
    if self.report_further_action_pictures.first.present?
      # byebug
      url = self.report_further_action_pictures.first.url.present? ? self.report_further_action_pictures.first.url : nil
      full_url =  url !=nil ? root_url + url : ""
    end		
		return full_url	
	end
end
