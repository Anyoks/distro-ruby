module Mutations
    class SignOut < Mutations::BaseMutation
      graphql_name "SignOut"

    #   argument :token, String, required: true
    #   argument :password, String, required: true
  
      field :user, Types::UserType, null: false
  
    #   byebug
      def resolve
        # authorize_user

        # byebug

        user = context[:current_user]
        if user.present?
          success = user.reset_authentication_token!
  
          MutationResult.call(
            obj: { user: user },
            success: success,
            errors: user.errors
          )
        else
          GraphQL::ExecutionError.new("User not signed in")
        end
      end
    end
  end