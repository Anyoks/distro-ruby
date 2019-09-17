# == Schema Information
#
# Table name: accounts
#
#  id           :uuid             not null, primary key
#  number       :string
#  meterSerial  :string
#  name         :string
#  walkroute_id :uuid
#  address      :string
#  latitude     :float
#  longitude    :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Account, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
