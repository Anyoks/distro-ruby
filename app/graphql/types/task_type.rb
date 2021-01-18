module Types
  class TaskType < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :positions, [Types::PositionType], null: true
    field :assignments, [Types::AssignmentType], null: true
    field :staffs, [Types::StaffType], null: true
    field :total_assignments, Integer, null: false
    field :total_assign_group_by_week, [Types::GroupDateType] , null: true
    field :forms, [Types::FormType] , null: true
    # tasks_for_graph

    # get totals for a particular user.
    field :my_total_assignments, Integer, null: true do
        argument :userId, String, required: true
    end
  end

  
end
