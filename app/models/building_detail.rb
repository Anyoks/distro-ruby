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

class BuildingDetail < ApplicationRecord
  belongs_to :building_type_cartegory
end
