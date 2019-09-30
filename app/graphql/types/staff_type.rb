module Types
  class StaffType < Types::BaseObject
    field :id, ID, null: false
    field :firstName, String, null: false
    field :lastName, String, null: false
    field :phoneNumber, String, null: false
    field :position, Types::PositionType, null: true
    field :assignments, [Types::AssignmentType], null: true

    field :authentication_token, String, null: false
    def authentication_token
      if object.gql_id != context[:current_staff]&.gql_id
        raise GraphQL::UnauthorizedFieldError,
              'Unable to access authentication_token'
      end

      object.authentication_token
    end
  end
end
