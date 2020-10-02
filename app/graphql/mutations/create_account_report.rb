module Mutations
  class CreateAccountReport < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :assignment_id, String, required: true
    argument :latitude, Float, required: true
    argument :longitude, Float, required: true
    argument :accuracy, Float, required: false
    argument :altitude, Float, required: false
   

    field :account_report, Types::AccountReportType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true

    # TODO: define resolve method
    def resolve(assignment_id:,latitude:,longitude:,accuracy:,altitude:)
      account_report = AccountReport.new(
        assignment_id: assignment_id,
        longitude: longitude, latitude:latitude, accuracy: accuracy, altitude:altitude
      )

      if account_report.save
        {
          account_report: account_report,
          success: true,
          errors:  []
        }
      else
        { 
          account_report: nil,
          success: false,
          errors: account_report.errors.full_messages
        }
      end
    end
  end
end
