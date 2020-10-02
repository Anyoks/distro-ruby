module Mutations
  class CreateDepartment < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    argument :name, String, required: true
    argument :description, String, required: true
    argument :subdepartment_ids, [String], required: true

    field :department, Types::DepartmentType, null: true


    def resolve(name:, description:,subdepartment_ids:)
      department = Department.create!(name: name, description: description)

      if department.persisted?
         subdepartments = []
          if !subdepartment_ids.empty?
            # iterate and add each subdepartment to array
            subdepartment_ids.each do |sub|
              subdepartment = Subdepartment.find(sub)
              if subdepartment
                 subdepartments << subdepartment
              end
            end
            # add all subdepartments to the HABTM join table
            department.subdepartments << subdepartments
          else
            # remove all subdepartments
            department.subdepartments = subdepartments
          end
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
