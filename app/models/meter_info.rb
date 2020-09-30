# == Schema Information
#
# Table name: meter_infos
#
#  id                   :uuid             not null, primary key
#  zone_report_id       :uuid
#  dma_report_id        :uuid
#  meter_status_id      :uuid
#  meter_serial         :string
#  meter_reading        :string
#  meter_accessible     :boolean
#  meter_present        :string
#  meter_stand_location :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  account_report_id    :uuid
#

class MeterInfo < ApplicationRecord
  belongs_to :zone_report, optional: true
  belongs_to :dma_report, optional: true
  belongs_to :account_report, optional: true
  belongs_to :meter_status
  validates_uniqueness_of :dma_report_id, scope: [:zone_report_id, :account_report_id]


  has_many :meter_info_pictures, dependent: :destroy
end
