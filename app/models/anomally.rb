class Anomally < ApplicationRecord
  belongs_to :zone_report, optional: true
  belongs_to :dma_report, optional: true
  belongs_to :meter_stand_problem
  belongs_to :illegaluse
  has_many :anomally_pictures


end
