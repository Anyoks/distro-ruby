module Types
  class UserType < Types::BaseObject
    field :id, String, null: false
    field :firstName, String, null: false
    field :lastName, String, null: false
    field :role, Types::RoleType, null: false
  end
end
