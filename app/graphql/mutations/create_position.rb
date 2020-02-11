module Mutations
  class CreatePosition < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    
    argument :name, String, required: true
    argument :description, String, required: true
    argument :subdepartment_ids,[ String], required: true

    field :position, Types::PositionType, null: true


    def resolve(name:,description:,subdepartment_ids:)
      position = Position.create!(name: name, description: description)

      if position.persisted?
        subdepartments = []
         if !subdepartment_ids.empty?
           subdepartment_ids.each do |sub|
             subdepartment = Subdepartment.find(sub)
             subdepartments << subdepartment
           end
           position.subdepartments << subdepartments
         end
        
          MutationResult.call(
            obj: { position: position },
            success: true,
            errors:  []
          )
      else
          MutationResult.call(
            obj: { },
            success: false ,
            errors: position.errors 
          )
      end
    end

    
  end
end
