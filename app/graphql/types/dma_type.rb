module Types
  class DmaType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :zones, [Types::ZoneType], null: true
  end
end
