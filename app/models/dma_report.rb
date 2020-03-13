class DmaReport < ApplicationRecord
  belongs_to :scheme
  # belongs_to :dma
  belongs_to :bulk_meter
  belongs_to :dma_assignment
  has_one :connection_info, dependent: :destroy
  has_one :anomally, dependent: :destroy
  has_one :meter_info, dependent: :destroy
  has_one :burst_and_lealage, dependent: :destroy
  has_one :report_further_action, dependent: :destroy
  has_many :dmapictures, dependent: :destroy


  validates_uniqueness_of :dma_assignment_id
end
