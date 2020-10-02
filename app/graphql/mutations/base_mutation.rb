# module Mutations
#     # This class is used as a parent for all mutations, and it is the place to have common utilities
#     class BaseMutation < GraphQL::Schema::Mutation
#       null false
#     end
#   end

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation

    # before_action :authenticate_user!  
    # Add your custom classes if you have them:
    # This is used for generating payload types
    object_class Types::BaseObject

    # This is used for return fields on the mutation's payload
    field_class Types::BaseField

    # This is used for generating the `input: { ... }` object type
    input_object_class Types::BaseInputObject

    # https://github.com/rmosolgo/graphql-ruby/issues/1837
    field :success, Boolean, null: false
    field :errors, [String], null: true

    protected

    def authorize_user
      # authenticate_user!

      return true if context[:current_user].present?

      raise GraphQL::ExecutionError, "User not signed in"
    end

    def authorize_staff
      # authenticate_user!

      return true if context[:current_staff].present?

      raise GraphQL::ExecutionError, "Staff not signed in"
    end
  end
end