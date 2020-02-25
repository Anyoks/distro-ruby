module Mutations
  class CreateZoneAssignment < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :user_id, String, required: true
    argument :staff_id, String, required: true
    argument :desc, String, required: true
    argument :task_id, String, required: true
    argument :zone_ids, [String], required: true
    argument :number_of_assignments, Integer , required: true  # number of assignemts per zone

    field :zoneAssignments, [Types::ZoneAssignmentType], null: true

    def resolve(user_id:,task_id:, staff_id:, zone_ids:,number_of_assignments:,desc:)
      created_assignments = []
      assignment_errors = []
      assignments = []
      failed_assignments = []

      number_of_assignments.times do
        zone_ids.each do |zone|
          # TODO change user_id from id to email?
          assignment = ZoneAssignment.create!(user_id: user_id, task_id: task_id, staff_id: staff_id, zone_id: zone, desc: desc)

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
          obj: { zone_assignments: assignments },
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
