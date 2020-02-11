module Mutations
  class CreateSubdepartment < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :name, String, required: true
    argument :description, String, required: true
    argument :department_id, String, required: true

    field :subdepartment, Types::SubdepartmentType, null: true


    def resolve(name:,description:,department_id:)
      subdepartment = Subdepartment.create!(name: name, description: description, department_id: department_id)

      if subdepartment.persisted?
          MutationResult.call(
            obj: { subdepartment: subdepartment },
            success: true,
            errors:  []
          )
      else
          MutationResult.call(
            obj: { },
            success: false ,
            errors: subdepartment.errors 
          )
      end
    end
    
  end
end
