module Types
  class ZoneType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :desctiption, String, null: false
    field :subzone, [Types::SubzoneType], null: true
    field :scheme, [Types::SchemeType], null: true
  end
end
