# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, String, null: false
    field :email, String, null: false
    field :firstName, String, null: false
    field :lastName, String, null: false
    field :role, Types::RoleType, null: false
    field :authentication_token, String, null: false
    def authentication_token
      if object.gql_id != context[:current_user]&.gql_id
        raise GraphQL::UnauthorizedFieldError,
              'Unable to access authentication_token'
      end

      object.authentication_token
    end
  end
end
