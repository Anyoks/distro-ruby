# frozen_string_literal: true

module Mutations
  class CreateAssignment < GraphQL::Schema::RelayClassicMutation
    graphql_name 'CrateAssignment'

    #   "account_ids" : ["02bd72e4-43dc-478f-ad4b-3a74829ed9f9", "ff8ead33-76e7-4212-a5e1-6971c017e316",  "0388ae32-5bd2-4482-9d67-1a4a4741c016" ],
    # "staff_id"    : "687c109e-1d9c-4413-b2a6-562aeba91f6b" ,
    # "task_id"     : "2b88a491-95ff-44eb-8665-5609fc832897"

    argument :staff_id, String, required: true
    argument :task_id, String, required: true
    argument :account_ids, [String], required: true

    field :assignments, [Types::AssignmentType], null: true

    def resolve(task_id:, staff_id:, account_ids:)
      created_assignments = []
      assignment_errors = []
      assignments = []
      failed_assignments = []

      account_ids.each do |account|
        assignment = Assignment.create!(task_id: task_id, staff_id: staff_id, account_id: account)

        if assignment.persisted?
          created_assignments << assignment.id
          assignments << assignment
          
          # MutationResult.call(
          #   obj: { assignment: assignment },
          #   success:  assignment.persisted?,#assignments.length == account_ids.length,
          #   errors: assignment.errors #failed_assignments[0].present?  ? failed_assignments[0].errors : []
          # )
        else 
          assignment_errors << assignment.errors.full_messages
          failed_assignments << assignment
        end
      end

      # if failed_assignments.present?

      # end

      MutationResult.call(
        obj: { assignments: assignments },
        success: assignments.length == account_ids.length,
        errors: failed_assignments[0].present?  ? failed_assignments[0].errors : []
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new(
        "Invalid Attributes for #{e.record.class.name}: " \
        "#{e.record.errors.full_messages.join(', ')}"
      )
    end
  end
end
