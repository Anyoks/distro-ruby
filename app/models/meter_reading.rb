# == Schema Information
#
# Table name: meter_readings
#
#  id         :uuid             not null, primary key
#  previous   :string
#  current    :string
#  account_id :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MeterReading < ApplicationRecord
  belongs_to :account
end
