module Mutations
  class UpdateStaff < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :id, String, required: true
    # argument :department_id, String, required: true
    argument :position_id, String, required: true
    

    field :staff, Types::StaffType, null: true


    def resolve(first_name:,last_name:,id:,position_id:)
      # byebug
      staff = Staff.find(id)

      if staff.present?
          staff.update_attributes(first_name: first_name,last_name: last_name,position_id: position_id)
         

          MutationResult.call(
            obj: { staff: staff },
            success: true,
            errors:  []
          )
      else
          MutationResult.call(
            obj: { },
            success: false ,
            errors: staff.errors 
          )
      end
    end

   
  end
end
