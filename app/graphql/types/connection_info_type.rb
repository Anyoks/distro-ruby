module Types
  class ConnectionInfoType < Types::BaseObject
    field :id, String, null: false
    field :zone_report_id, String, null: true
    field :dma_report_id, String, null: true
    field :building_type_cartegory_id , String, null: false
    field :building_info_id , String, null: false
    field :labelled , String, null: false
    field :connection_number , String, null: false
    field :account_status_id, String, null: false
  end
end
