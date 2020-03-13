module Types
  class ReportFurtherActionType < Types::BaseObject
    field :id       , String, null: false
    field :account_report_id   ,String, null: true
    field :account_report   ,Types::AccountReportType, null: true
    field :dma_report_id  ,String, null: true
    field :dma_report  ,Types::DmaReportType, null: true
    field :zone_report_id  ,String, null: true
    field :zone_report  ,Types::ZoneReportType, null: true

  end
end
