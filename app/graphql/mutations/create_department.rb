module Mutations
  class CreateDepartment < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    argument :name, String, required: true
    argument :description, String, required: true

    field :department, Types::DepartmentType, null: true


    def resolve(name:, description:)
      department = Department.create!(name: name, description: description)

      if department.persisted?
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
