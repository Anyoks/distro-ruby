module Mutations
  class CreateZoneReport < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :scheme_id, String, required: true
    argument :bulk_meter_id, String, required: true
    
    argument :zone_assignment_id, String, required: true
    argument :latitude, Float, required: true
    argument :longitude, Float, required: true
    argument :accuracy, Float, required: false
    argument :altitude, Float, required: false
    

    field :zone_report, Types::ZoneReportType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true
    

    # TODO: define resolve method
    def resolve(scheme_id:,bulk_meter_id:,zone_assignment_id:,latitude:,longitude:,accuracy:,altitude:)
      zone_report = ZoneReport.new({scheme_id: scheme_id, bulk_meter_id: bulk_meter_id,
          zone_assignment_id: zone_assignment_id,
         longitude: longitude, latitude:latitude, accuracy: accuracy, altitude:altitude}.reject{ |k,v| v.blank?} )
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
          errors: zone_report.errors.full_messages
        }
        
      end
    end
  end
end
