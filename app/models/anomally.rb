# == Schema Information
#
# Table name: anomallies
#
#  id                     :uuid             not null, primary key
#  zone_report_id         :uuid
#  dma_report_id          :uuid
#  meter_stand_problem_id :uuid
#  illegaluse_id          :uuid
#  labelled               :boolean
#  other_problem          :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  account_report_id      :uuid
#  other_illegal_use      :string
#

class Anomally < ApplicationRecord
  belongs_to :zone_report, optional: true
  belongs_to :dma_report, optional: true
  belongs_to :account_report, optional: true
  belongs_to :meter_stand_problem
  belongs_to :illegaluse
  has_many :anomally_pictures, dependent: :destroy
  has_many :illegal_use_pictures, dependent: :destroy

  validates_uniqueness_of :dma_report_id, scope: [:zone_report_id, :account_report_id]
  # :zone_report_id , :account_report_id

  def anomally_image 

		if Rails.env == "development" 
			root_url = "http://localhost:3000"
		else
			root_url = "https://distroapp.io"
		end

    urls = []
    full_url = ""
    if self.anomally_pictures.first.present?
      # byebug
      url = self.anomally_pictures.first.url.present? ? self.anomally_pictures.first.url : nil
      full_url =  url !=nil ? root_url + url : ""
    end
    
			# urls << root_url + pic.image.url(:medium)
		
		return full_url
  end

  def illegal_use_image
    if Rails.env == "development" 
			root_url = "http://localhost:3000"
		else
			root_url = "https://distroapp.io"
		end

    urls = []
    full_url = ""
    if self.illegal_use_pictures.first.present?
      # byebug
      url = self.illegal_use_pictures.first.url.present? ? self.illegal_use_pictures.first.url : nil
      full_url =  url !=nil ? root_url + url : ""
    end
    
			# urls << root_url + pic.image.url(:medium)
		
		return full_url
  end
end
