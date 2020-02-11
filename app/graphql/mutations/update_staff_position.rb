module Mutations
  class UpdateStaffPosition < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    

    argument :staff_id, String, required: true
    argument :position_id, String, required: true
    # argument :id, String, required: true
    

    field :staff, Types::StaffType, null: true


    def resolve(staff_id:,position_id:)
      # byebug
      staff = Staff.find(staff_id)

      if staff.present?
          staff.update_attributes(position_id: position_id)
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
