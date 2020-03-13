class BurstAndLealage < ApplicationRecord
  belongs_to :zone_report, optional: true
  belongs_to :dma_report, optional: true
  belongs_to :account_report, optional: true
  belongs_to :pipematerial
  belongs_to :pipesize

  has_many :burst_pictures, dependent: :destroy
  has_many :land_mark_pictures, dependent: :destroy
  validates_uniqueness_of :dma_report_id, scope: [:zone_report_id]

end
