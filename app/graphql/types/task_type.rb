module Types
  class TaskType < Types::BaseObject
    field :name, String, null: false
    field :desctiption, String, null: false
    field :subdepartment, Types::SubdepartmentType, null: true
    field :assignments, [Types::AssignmentType], null: true
  end
end
