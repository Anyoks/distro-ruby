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

class BuildingTypeCartegory < ApplicationRecord
      before_validation :set_default_building_type, on: :create
    belongs_to :building_type
    has_many :building_details
    has_many :account_details

    def set_default_building_type
        BuildingType.first
        self.building_type_id =  BuildingType.first.id
    end
end
