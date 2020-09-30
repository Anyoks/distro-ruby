module Types
  class ZoneType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :description, String, null: false
    field :subzone, [Types::SubzoneType], null: true
    field :scheme, [Types::SchemeType], null: true
    field :accounts, [Types::AccountType], null: true
  end
end
