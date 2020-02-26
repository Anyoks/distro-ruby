module Types
  class MeterInfoType < Types::BaseObject
    field :id, String, null: false
    field :zone_report_id, String, null: true
    field :dma_report_id, String, null: true
    field :meter_status_id, String, null: false
    field :meter_serial, String, null: false
    field :meter_accessible, String, null: false
    field :meter_present, String, null: false
    field :meter_stand_location, String, null: false
  end
end
