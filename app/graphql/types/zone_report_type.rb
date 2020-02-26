module Types
  class ZoneReportType < Types::BaseObject
    field :id, String, null: false
    field :scheme_id, String, null: false
    field :zone_id, String, null: false
    field :bulk_meter_id, String, null: false
    field :further_action_id, String, null: false
    field :zone_assignment_id, String, null: false
  end
end

