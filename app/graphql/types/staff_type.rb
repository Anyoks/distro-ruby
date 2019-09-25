module Types
  class StaffType < Types::BaseObject
    field :firstName, String, null: false
    field :lastName, String, null: false
    field :phoneNumber, String, null: false
    field :description, String, null: false
    field :position, Types::PositionType, null: true
    field :assignments, [Types::AssignmentType], null: true
  end
end
