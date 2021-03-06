module Mutations
    class StaffSignIn < Mutations::BaseMutation
      graphql_name "StaffSignIn"
  
      argument :phoneNumber, String, required: true
      argument :password, String, required: true
  
      field :staff, Types::StaffType, null: false
  
      def resolve(args)
        staff = Staff.find_for_database_authentication(phone_number: args[:phone_number])
        if staff.present?
          if staff.valid_password?(args[:password])
            context[:current_staff] = staff
            context[:session][:token] = staff.authentication_token
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