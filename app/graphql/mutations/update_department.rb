module Mutations
  class UpdateDepartment < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :name, String, required: true
    argument :description, String, required: true
    argument :id, String, required: true
    

    field :department, Types::DepartmentType, null: true


    def resolve(name:,description:,id:)
      # byebug
      department = Department.find(id)

      if department.present?
          department.update_attributes(name: name,description: description)
          MutationResult.call(
            obj: { department: department },
            success: true,
            errors:  []
          )
      else
          MutationResult.call(
            obj: { },
            success: false ,
            errors: department.errors 
          )
      end
    end


    
  end
end
