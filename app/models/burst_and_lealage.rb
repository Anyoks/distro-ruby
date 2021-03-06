# == Schema Information
#
# Table name: burst_and_lealages
#
#  id               :uuid             not null, primary key
#  zone_report_id   :uuid
#  dma_report_id    :uuid
#  pipematerial_id  :uuid
#  pipesize_id      :uuid
#  surrounding_area :string
#  remarks          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class BurstAndLealage < ApplicationRecord
  belongs_to :zone_report, optional: true
  belongs_to :dma_report, optional: true
  belongs_to :account_report, optional: true
  belongs_to :pipematerial
  belongs_to :pipesize

  has_many :burst_pictures, dependent: :destroy
  has_many :land_mark_pictures, dependent: :destroy
  validates_uniqueness_of :dma_report_id, scope: [:zone_report_id]

   def burst_image 

		if Rails.env == "development" 
			root_url = "http://localhost:3000"
		else
			root_url = "https://wayspoint.com"
		end

    urls = []
    full_url = ""
    if self.burst_pictures.first.present?
      # byebug
      url = self.burst_pictures.first.url.present? ? self.burst_pictures.first.url : nil
      full_url =  url !=nil ? root_url + url : ""
    end
    
			# urls << root_url + pic.image.url(:medium)
		
		return full_url
  end

  def landmark_image 

		if Rails.env == "development" 
			root_url = "http://localhost:3000"
		else
			root_url = "https://wayspoint.com"
		end

    urls = []
    full_url = ""
    if self.land_mark_pictures.first.present?
      # byebug
      url = self.land_mark_pictures.first.url.present? ? self.land_mark_pictures.first.url : nil
      full_url =  url !=nil ? root_url + url : ""
    end
    
			# urls << root_url + pic.image.url(:medium)
		
		return full_url
  end
end
