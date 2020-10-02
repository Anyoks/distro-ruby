module Mutations
    class RegisterStaff < Mutations::BaseMutation
      graphql_name "RegisterStaff"
  
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :email, String, required: true
      argument :password, String, required: true
      argument :phone_number, String, required: true
      argument :position_id, String, required: true
  
      field :staff, Types::StaffType, null: false
  
      def resolve(args)
        staff = Staff.create!(args)
  
        # current_staff needs to be set so authenticationToken can be returned
        context[:current_staff] = staff
  
        MutationResult.call(
          obj: { staff: staff },
          success: staff.persisted?,
          errors: staff.errors
        )
      rescue ActiveRecord::RecordInvalid => invalid
        GraphQL::ExecutionError.new(
          "Invalid Attributes for #{invalid.record.class.name}: " \
          "#{invalid.record.errors.full_messages.join(', ')}"
        )
      end
    end
  end