module Types
  class AccountType < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: false
    field :number, String, null: false
    field :meterSerial, String, null: true
    field :walkroute, Types::WalkrouteType, null: true
    field :number, String, null: false
    field :latitude, Float, null: true
    field :longitude, Float, null: true
  end
end
