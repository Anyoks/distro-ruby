module Mutations
    class StaffSignIn < Mutations::BaseMutation
      graphql_name "StaffSignIn"
  
      argument :email, String, required: true
      argument :password, String, required: true
  
      field :staff, Types::StaffType, null: false
  
      def resolve(args)
        staff = Staff.find_for_database_authentication(email: args[:email])
  
        if staff.present?
          if staff.valid_password?(args[:password])
            context[:current_staff] = staff
            # byebug
            MutationResult.call(obj: { staff: staff }, success: true)
          else
            GraphQL::ExecutionError.new("Incorrect Email/Password")
          end
        else
          GraphQL::ExecutionError.new("staff not registered on this application")
        end
      end
    end
  end