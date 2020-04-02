class ZoneReport < ApplicationRecord
  belongs_to :scheme
  belongs_to :bulk_meter
  belongs_to :zone_assignment
  has_one :connection_info, dependent: :destroy
  has_one :anomally, dependent: :destroy
  has_one :meter_info, dependent: :destroy
  has_one :burst_and_lealage, dependent: :destroy
  has_one :report_further_action, dependent: :destroy
  has_many :zonepictures, dependent: :destroy

  validates_uniqueness_of :zone_assignment_id
end
