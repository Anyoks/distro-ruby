module Mutations
  class CreateTask < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false


    argument :name, String, required: true
    argument :description, String, required: true
    argument :subdepartment_ids, [String], required: true

    field :task, Types::TaskType, null: true


    def resolve(name:,description:,subdepartment_ids:)
      task = Task.create!(name: name, description: description)

      if task.persisted?
          subdepartments = []
          if !subdepartment_ids.empty?
            subdepartment_ids.each do |sub|
               subdepartment = Subdepartment.find(sub)
               subdepartments << subdepartment
            end

            task.subdepartments << subdepartments
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
