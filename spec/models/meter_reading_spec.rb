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

require 'rails_helper'

RSpec.describe MeterReading, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
