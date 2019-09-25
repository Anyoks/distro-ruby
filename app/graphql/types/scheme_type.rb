module Types
  class SchemeType < Types::BaseObject
    field :name, String, null: false
    field :id, ID, null: false
    field :description, String, null: false
    field :zones, [Types::ZoneType], null: true
  end
end
