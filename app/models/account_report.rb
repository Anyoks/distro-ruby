class AccountReport < ApplicationRecord
  belongs_to :assignment

  has_one :connection_info, dependent: :destroy
  has_one :anomally, dependent: :destroy
  has_one :meter_info, dependent: :destroy
  has_one :report_further_action, dependent: :destroy

  validates_uniqueness_of :assignment_id
end
