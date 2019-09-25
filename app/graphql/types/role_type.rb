module Types
  class RoleType < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: false
    field :users, [Types::UserType], null: false
  end
end
