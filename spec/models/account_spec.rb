# == Schema Information
#
# Table name: accounts
#
#  id                 :uuid             not null, primary key
#  number             :string
#  meter_serial       :string
#  name               :string
#  walkroute_id       :uuid
#  address            :string
#  latitude           :float
#  longitude          :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  old_account_number :string
#  sewer              :string
#  water              :string
#  connection_status  :string
#  tariff             :string
#  building_type      :string
#  house_type         :string
#  house_units        :string
#

require 'rails_helper'

RSpec.describe Account, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
