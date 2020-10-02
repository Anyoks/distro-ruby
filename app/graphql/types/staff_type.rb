module Types
  class StaffType < Types::BaseObject
    field :id, ID, null: false
    field :firstName, String, null: false
    field :lastName, String, null: false
    field :full_names, String, null: true
    field :phoneNumber, String, null: false
    field :email, String, null: true
    field :position, Types::PositionType, null: true
    field :assignments, [Types::AssignmentType], null: true
    field :undoneAssignments, [Types::AssignmentType], null: true
    field :doneAssignments, [Types::AssignmentType], null: true
    field :total_assignments, Integer, null: false
    field :total_un_done_assignments, Integer, null: false
    field :authentication_token, String, null: false
    field :undoneZoneAssignments, [Types::ZoneAssignmentType], null: true
    field :undoneDmaAssignments, [Types::DmaAssignmentType], null: true






    
    def authentication_token
      if object.gql_id != context[:current_staff]&.gql_id
        raise GraphQL::UnauthorizedFieldError,
              'Unable to access authentication_token'
      end

      object.authentication_token
    end
  end
end
