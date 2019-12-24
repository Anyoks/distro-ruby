# == Schema Information
#
# Table name: building_types
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BuildingType < ApplicationRecord
    has_many :building_type_cartegories
end
