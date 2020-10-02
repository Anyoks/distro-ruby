# == Schema Information
#
# Table name: report_further_actions
#
#  id                 :uuid             not null, primary key
#  zone_report_id     :uuid
#  dma_report_id      :uuid
#  account_report_id  :uuid
#  relocate_meter     :boolean
#  raise_meter        :boolean
#  replace_meter      :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  remark             :string
#  action_taken       :boolean
#  other              :string
#  disconnection_type :string
#  repairs_done       :string
#

class ReportFurtherAction < ApplicationRecord
  belongs_to :zoneReport, optional: true
  belongs_to :dmaReport, optional: true
  belongs_to :accountReport, optional: true
  
  has_many :report_further_action_pictures


  def image_url

		if Rails.env == "development" 
			root_url = "http://localhost:3000"
		else
			root_url = "https://wayspoint.com"
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
