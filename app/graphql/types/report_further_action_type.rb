module Types
  class ReportFurtherActionType < Types::BaseObject
    field :id       , String, null: false
    field :account_report_id   ,String, null: true
    field :account_report   ,Types::AccountReportType, null: true
    field :dma_report_id  ,String, null: true
    field :dma_report  ,Types::DmaReportType, null: true
    field :zone_report_id  ,String, null: true
    field :zone_report  ,Types::ZoneReportType, null: true

    field :relocate_meter  ,Boolean, null: true
    field :raise_meter  ,Boolean, null: true
    field :replace_meter  ,Boolean, null: true
    field :remark  ,String, null: true
    field :action_taken  ,Boolean, null: true
    field :other  ,String, null: true
    field :disconnection_type  ,String, null: true
    field :repairs_done  ,String, null: true
    
    field :image  ,String, null: true

    def image
      object.image_url
    end
  end
end
