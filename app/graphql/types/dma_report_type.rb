module Types
  class DmaReportType < Types::BaseObject
    field :id, String, null: false
    field :scheme_id, String, null: false
    field :dma_id, String, null: false
    field :bulk_meter_id, String, null: false
    field :further_action_id, String, null: false
    field :dma_assignment_id, String, null: false
  end
end
