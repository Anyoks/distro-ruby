module Types
  class AccountReportType < Types::BaseObject
    field :id, String, null: false
    field :account_id, String, null: false
    field :latitude, Float, null: true
    field :longitude, Float, null: true
    field :accuracy, Float, null: true
    field :report_further_action, Types::ReportFurtherActionType, null: true
    field :assignment_id, String, null: false
    field :assignment,  Types::AssignmentType, null: false
    field :stageName, String, null: false
    field :further_action_image, String, null: true
    field :date, String, null: false
    field :reported_by, String, null: false
    field :connection_info, Types::ConnectionInfoType, null: true
    field :anomally, Types::AnomallyType, null: true
    field :report_type, String, null: true
    field :current_reading, String, null: true
    field :previous_reading, String, null: true

    def further_action_image
      object.image_url
    end
    # :connection_info, dependent: :destroy
# :anomally, dependent: :destroy
# :meter_info, dependent: :destroy
  end
end
