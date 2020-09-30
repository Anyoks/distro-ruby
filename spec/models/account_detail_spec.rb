# == Schema Information
#
# Table name: account_details
#
#  id                         :uuid             not null, primary key
#  name                       :string
#  current_reading            :string
#  previous_reading           :string
#  account_id                 :uuid
#  account_status_id          :uuid
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  meter_serial               :string
#  building_type_cartegory_id :uuid
#

require 'rails_helper'

RSpec.describe AccountDetail, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
