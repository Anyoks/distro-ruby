module Types
  class WalkrouteType < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: false
    field :description, String, null: false
    field :subzone, Types::SubzoneType, null: true
  end
end
