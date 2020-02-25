class Anomally < ApplicationRecord
  belongs_to :zone_report, optional: true
  belongs_to :dma_report, optional: true
  belongs_to :meter_stand_problem
  belongs_to :illegaluse
  belongs_to :account_status
  has_may :anomally_pictures


end
