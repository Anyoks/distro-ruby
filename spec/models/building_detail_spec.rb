# == Schema Information
#
# Table name: building_details
#
#  id                         :uuid             not null, primary key
#  name                       :string
#  description                :string
#  building_type_cartegory_id :uuid
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

require 'rails_helper'

RSpec.describe BuildingDetail, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
