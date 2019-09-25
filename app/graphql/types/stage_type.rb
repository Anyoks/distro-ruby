module Types
  class StageType < Types::BaseObject
    field :name, String, null: false
    field :id, ID, null: false
    field :description, String, null: false
    field :assignments, [Types::AssignmentType], null: true
  end
end
