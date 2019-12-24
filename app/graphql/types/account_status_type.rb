module Types
  class AccountStatusType < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: true
  end
end
