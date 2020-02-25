class MeterInfo < ApplicationRecord
  belongs_to :zone_report, optional: true
  belongs_to :dma_report, optional: true
  belongs_to :meter_status


  has_many :meter_info_pictures
end
