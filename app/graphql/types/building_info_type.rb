module Types
  class BuildingInfoType < Types::BaseObject
    field :id, String, null: true
    field :single_rooms,  String, null: true
    field :bedsitters,  String, null: true
    field :one_bedrooms,  String, null: true
    field :two_bedrooms,  String, null: true
    field :three_bedrooms,  String, null: true
    field :floor_id,   String, null: true
    field :connection_info_id, String, null: true
  end
end
