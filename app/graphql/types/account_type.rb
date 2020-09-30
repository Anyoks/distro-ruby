module Types
  class AccountType < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: true
    field :number, String, null: true
    field :old_account_number, String, null: true
    field :meterSerial, String, null: true
    field :walkroute, Types::WalkrouteType, null: true
    field :zone, Types::ZoneType, null: true
    field :latitude, Float, null: true
    field :longitude, Float, null: true
  end
end
