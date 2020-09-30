# == Schema Information
#
# Table name: building_type_cartegories
#
#  id               :uuid             not null, primary key
#  name             :string
#  description      :string
#  building_type_id :uuid
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe BuildingTypeCartegory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
