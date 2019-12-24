module Types
  class AccountDetailType < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: true
    field :account_id, String, null: true
    field :current_reading, String, null: true
    field :previous_reading, String, null: true
    field :account_status_id, String, null: true
    field :meter_serial, String, null: true
    field :building_type_cartegory_id, String, null: true
    field :account, Types::AccountType, null: false
    field :account_status, Types::AccountStatusType, null: false
    field :building_type_cartegory_id, Types::BuildingTypeCartegoryType, null: false
  end
end
