module Types
  class SubzoneType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :zone, Types::ZoneType, null: true
  end
end
