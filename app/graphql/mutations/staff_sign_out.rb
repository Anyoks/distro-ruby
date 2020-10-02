module Mutations
    class StaffSignOut < Mutations::BaseMutation
      graphql_name "StaffSignOut"

    #   argument :token, String, required: true
    #   argument :password, String, required: true
  
      field :staff, Types::StaffType, null: false
  
    #   byebug
      def resolve
        # authorize_staff

        # byebug

        staff = context[:current_staff]
        if staff.present?
          success = staff.reset_authentication_token!
  
          MutationResult.call(
            obj: { staff: staff },
            success: success,
            errors: staff.errors
          )
        else
          GraphQL::ExecutionError.new("staff not signed in")
        end
      end
    end
  end