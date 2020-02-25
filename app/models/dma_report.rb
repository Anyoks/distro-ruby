class DmaReport < ApplicationRecord
  belongs_to :scheme
  belongs_to :dma
  belongs_to :bulk_meter
  belongs_to :dma_assignment
  has_one :connection_info
  has_one :anomally
  has_one :meter_info
  has_one :burst_and_leaks
  belongs_to :further_action
  has_many :dmapictures
end
