module Mutations
  class CreateSubdepartment < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :name, String, required: true
    argument :description, String, required: true
    argument :department_id, String, required: true
    argument :position_ids, [String], required: true

    field :subdepartment, Types::SubdepartmentType, null: true


    def resolve(name:,description:,department_id:,position_ids:)
      subdepartment = Subdepartment.create!(name: name, description: description, department_id: department_id)

      if subdepartment.persisted?
         positions = []
          if !position_ids.empty?
            # iterate and add each position to array
            position_ids.each do |pos|
              position = Position.find(pos)
              if position
                 positions << position
              end
            end
            # add all positions to the HABTM join table
            subdepartment.positions = positions
          else
            # remove all positions
            # subdepartment.positions = positions
          end
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
