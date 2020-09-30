module Types
  class ConnectionInfoType < Types::BaseObject
    field :id, String, null: false
    field :zone_report_id, String, null: true
    field :dma_report_id, String, null: true
    field :building_type_cartegory_id , String, null: true
    field :building_type_cartegory , Types::BuildingTypeCartegoryType, null: true
    field :building_info_id , String, null: true
    field :building_info , Types::BuildingInfoType, null: true
    field :labelled , String, null: true
    field :connection_number , String, null: true
    field :account_status_id, String, null: true
    field :account_status , Types::AccountStatusType, null: true
  end
end
