module Types
  class BuildingInfoType < Types::BaseObject
    field :id, String, null: false
    field :single_rooms,  String, null: false
    field :bedsitters,  String, null: false
    field :one_bedrooms,  String, null: false
    field :two_bedrooms,  String, null: false
    field :three_bedrooms,  String, null: false
    field :floor_id,   String, null: false
    field :connection_info_id, String, null: false
  end
end
