module Mutations
  class UpdateTask < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :name, String, required: true
    argument :description, String, required: true
    argument :id, String, required: true
    argument :position_ids, [String], required: true
    

    field :task, Types::TaskType, null: true


    def resolve(name:,description:,id:,position_ids:)
      # byebug
      task = Task.find(id)

      if task.present?
          task.update_attributes(name: name,description: description)
          positions = []
          if !position_ids.empty?
            # iterate and add each position to array
            position_ids.each do |sub|
              position = Position.find(sub)
              if position
                 positions << position
              end
            end
            # add all positions to the HABTM join table
            task.positions = positions
          else
            # remove all positions
            task.positions = positions
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
