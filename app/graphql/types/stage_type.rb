module Types
  class StageType < Types::BaseObject
    field :name, String, null: false
    field :id, ID, null: false
    field :description, String, null: false
    field :assignments, [Types::AssignmentType], null: true
    field :myassignments, [Types::AssignmentType], null: true do
        argument :userId, String, required: true
    end
    field :total_assignments, Integer, null: false

    # get totals for a particular user.
    field :my_total_assignments, Integer, null: true do
        argument :userId, String, required: true
    end
  end

 
end
