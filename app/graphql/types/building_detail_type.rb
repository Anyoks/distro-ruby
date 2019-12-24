module Types
  class BuildingDetailType < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: true
    field :description, String, null: false
    field :building_type_cartegory_id, String, null: true
  end
end
