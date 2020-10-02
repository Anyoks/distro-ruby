module Types
  class BuildingTypeType < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: true
    field :building_type_cartegories, [Types::BuildingTypeCartegoryType], null: true
  end
end
