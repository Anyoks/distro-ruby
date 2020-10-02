module Types
  class DmaReportType < Types::BaseObject
    field :id, String, null: false
    field :scheme_id, String, null: false
    field :dma_id, String, null: false
    field :dma, Types::DmaType, null: false
    field :bulk_meter_id, String, null: false
    field :further_action_id, String, null: false
    field :dma_assignment_id, String, null: false
    field :latitude, Float, null: true
    field :longitude, Float, null: true
    field :accuracy, Float, null: true
    field :report_further_action, Types::ReportFurtherActionType, null: true
    field :dma_assignment_id, String, null: false
    field :dma_assignment,  Types::DmaAssignmentType, null: false
    field :stageName, String, null: false
    field :further_action_image, String, null: true
    field :date, String, null: false
    field :reported_by, String, null: false
    field :connection_info, Types::ConnectionInfoType, null: true
    field :anomally, Types::AnomallyType, null: true

    field :meter_info, Types::MeterInfoType, null: true
    field :burst_and_lealage, Types:: BurstAndLealageType, null: true
    field :report_type, String, null: true

    def further_action_image
      object.image_url
    end
  end
end
