module Mutations
  class CreateTask < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false


    argument :name, String, required: true
    argument :description, String, required: true
    argument :position_ids, [String], required: true

    field :task, Types::TaskType, null: true


    def resolve(name:,description:,position_ids:)
      task = Task.create!(name: name, description: description)

      if task.persisted?
          positions = []
          if !position_ids.empty?
            position_ids.each do |sub|
               position = Position.find(sub)
               positions << position
            end

            task.positions << positions
          end
          MutationResult.call(
            obj: { task: task },
            success: true,
            errors:  []
          )
      else
          MutationResult.call(
            obj: { },
            success: false ,
            errors: task.errors 
          )
      end
    end


  end
end
