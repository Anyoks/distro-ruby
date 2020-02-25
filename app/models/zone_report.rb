class ZoneReport < ApplicationRecord
  belongs_to :scheme
  belongs_to :zone
  belongs_to :bulk_meter
  belongs_to :zone_assignment
  has_one :connection_info
  has_one :anomally
  has_one :meter_info
  has_one :burst_and_leaks
  belongs_to :further_action
  has_many :zonepictures
end
