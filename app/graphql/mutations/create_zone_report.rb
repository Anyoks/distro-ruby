module Mutations
  class CreateZoneReport < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :scheme_id, String, required: true
    argument :zone_id, String, required: true
    argument :bulk_meter_id, String, required: true
    argument :further_action_id, String, required: true
    argument :zone_assignment_id, String, required: true
    

    field :zone_report, Types::ZoneReportType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true
    

    # TODO: define resolve method
    def resolve(scheme_id:,zone_id:,bulk_meter_id:,further_action_id:,zone_assignment_id:)
      zone_report = ZoneReport.new(scheme_id: scheme_id, zone_id: zone_id, bulk_meter_id: bulk_meter_id,
         further_action_id: further_action_id, zone_assignment_id: zone_assignment_id )

      if zone_report.save
       
        {
          zone_report: zone_report,
          success: true,
          errors:  []
        }
        
      else
        
         { 
          zone_report: nil ,
          success: false,
          errors: zone_report.errors.messages
        }
        
      end
    end
  end
end
