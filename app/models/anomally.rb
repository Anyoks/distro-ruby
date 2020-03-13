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


end
