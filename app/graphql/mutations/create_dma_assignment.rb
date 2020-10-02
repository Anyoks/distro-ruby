module Mutations
  class CreateDmaAssignment < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :user_id, String, required: true
    argument :staff_id, String, required: true
    argument :desc, String, required: true
    argument :task_id, String, required: true
    argument :dma_ids, [String], required: true
    argument :number_of_assignments, Integer , required: true  # number of assignemts per dma

    field :dmaAssignments, [Types::DmaAssignmentType], null: true

    def resolve(user_id:,task_id:, staff_id:, dma_ids:,number_of_assignments:,desc:)
      created_assignments = []
      assignment_errors = []
      assignments = []
      failed_assignments = []

      number_of_assignments.times do
        dma_ids.each do |dma|
          # TODO change user_id from id to email?
          assignment = DmaAssignment.create!(user_id: user_id, task_id: task_id, staff_id: staff_id, dma_id: dma, desc: desc)

          if assignment.persisted?
            created_assignments << assignment.id
            assignments << assignment
            
            
          else 
            assignment_errors << assignment.errors.full_messages
            failed_assignments << assignment
          end
        end
      end

      if assignments
        MutationResult.call(
          obj: { dma_assignments: assignments },
          success: true,
          errors:  []
        )
      else
        MutationResult.call(
          obj: { },
          success: false ,
          errors: assignment_errors
        )
      end


    end
   
  end
end
