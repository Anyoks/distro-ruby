class ReportFurtherAction < ApplicationRecord
  belongs_to :zoneReport, optional: true
  belongs_to :dmaReport, optional: true
  belongs_to :accountReport, optional: true
  
  has_many :report_further_action_pictures
end
