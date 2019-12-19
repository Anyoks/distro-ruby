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

    argument :remark_id, String, required: true
    argument :meter_serial, String, required: false
    argument :meter_reading, String, required: false
    argument :other_remark, String, required: false

    field :report, Types::ReportType, null: false
    field :errors, [String], null: false
    field :other, String, null: true
    field :other_remark, String, null:true

    
    def resolve(completed:,comments:,further_action_id:,assignment_id:,other_comment:,remark_id:,meter_reading:,meter_serial:,other_remark:)
      
      report = Report.new(completed: completed ,comments: comments,further_action_id: further_action_id,assignment_id: assignment_id,remark_id: remark_id,meter_reading: meter_reading,meter_serial: meter_serial)
      
      if report.save
           
          
        if (other_comment.length != 0 && other_remark.length != 0)
          Other.create!(name: other_comment, further_action_id: further_action_id)
          OtherRemark.create!(name: other_remark, remark_id: remark_id )
            # Successful creation, return the created object with no errors
          {
            report: report,
            other: 'yes',
            other_remark: 'yes',
            errors: [],
          }
        elsif other_comment.length != 0
          Other.create!(name: other_comment, further_action_id: further_action_id)
          {
            report: report,
            other: 'yes',
            other_remark: 'no',
            errors: [],
          }
        elsif other_remark.length != 0
          OtherRemark.create!(name: other_remark, remark_id: remark_id )
            {
              report: report,
              other: 'no',
              other_remark: 'yes',
              errors: [],
            }
        end        
        
      else
        # Failed save, return the errors to the client
        # raise GraphQL::ExecutionError, report.errors.full_messages.join(", ")
        {
          report: nil,
          other: 'no',
          other_remark: 'no',
          errors: [report.errors.full_messages],
        }
      end
      # raise GraphQL::ExecutionError, report.errors.full_messages.join(", ")
    end
  end
end
