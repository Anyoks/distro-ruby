# == Schema Information
#
# Table name: building_infos
#
#  id                 :uuid             not null, primary key
#  single_rooms       :integer
#  bedsitters         :integer
#  one_bedrooms       :integer
#  two_bedrooms       :integer
#  three_bedrooms     :integer
#  floor_id           :uuid
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  connection_info_id :uuid
#

require 'rails_helper'

RSpec.describe BuildingInfo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
