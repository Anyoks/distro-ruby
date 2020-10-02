module Types
  class BuildingTypeCartegoryType < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: true
    field :description, String, null: false
    field :building_type_id, String, null: true
  end
end
