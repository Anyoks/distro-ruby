class MeterInfo < ApplicationRecord
  belongs_to :zone_report, optional: true
  belongs_to :dma_report, optional: true
  belongs_to :account_report, optional: true
  belongs_to :meter_status
  validates_uniqueness_of :dma_report_id, scope: [:zone_report_id, :account_report_id]


  has_many :meter_info_pictures, dependent: :destroy
end
