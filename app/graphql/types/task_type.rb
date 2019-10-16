module Types
  class TaskType < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: false
    field :desctiption, String, null: false
    field :subdepartment, Types::SubdepartmentType, null: true
    field :assignments, [Types::AssignmentType], null: true
    field :staffs, [Types::StaffType], null: true
    field :total_assignments, Integer, null: false
    field :total_assign_group_by_week, [Types::GroupDateType] , null: true
  end

  
end
