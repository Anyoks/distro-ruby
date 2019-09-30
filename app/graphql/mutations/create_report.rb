module Mutations
  class CreateReport < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    argument :completed, Boolean, required: true
    argument :comments, String, required: true
    argument :further_action_id, String, required: true
    argument :assignment_id, String, required: true
    argument :other_comment, String, required: false

    field :report, Types::ReportType, null: false
    field :errors, [String], null: false
    field :other, String, null: true


    def resolve(completed:,comments:,further_action_id:,assignment_id:, other_comment:)
      report = Report.new(completed: completed ,comments: comments,further_action_id: further_action_id,assignment_id: assignment_id)
      if report.save
        if other_comment != nil
          Other.create!(name: other_comment, further_action_id: further_action_id)
          # Successful creation, return the created object with no errors
          {
            report: report,
            other: 'yes',
            errors: [],
          }
        else
          {
            report: report,
            other: nil,
            errors: [report.errors.full_messages],
          }
        
        end
      else
        # Failed save, return the errors to the client
        # raise GraphQL::ExecutionError, report.errors.full_messages.join(", ")
      end
      # raise GraphQL::ExecutionError, report.errors.full_messages.join(", ")
    end

  end
end
