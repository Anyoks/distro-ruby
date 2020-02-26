module Types
  class BurstAndLealageType < Types::BaseObject
    field :id, String, null: false
    field :zone_report_id, String, null: true
    field :dma_report_id, String, null: true
    field :pipematerial_id, String, null: false
    field :pipesize_id, String, null: false
    field :surrounding_area, String, null: true
    field :remarks, String, null: true
  end
end
