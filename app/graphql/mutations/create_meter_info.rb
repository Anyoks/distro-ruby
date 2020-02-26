module Mutations
  class CreateMeterInfo < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :zone_report_id, String, required: false
    argument :dma_report_id, String, required: false
    argument :meter_status_id, String, required: true
    argument :meter_serial, String, required: true
    argument :meter_accessible, Boolean, required: true
    argument :meter_present, Boolean, required: true
    argument :meter_stand_location, String, required: true

    field :meter_info, Types::MeterInfoType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true


    def resolve(zone_report_id:,dma_report_id:,meter_status_id:,meter_serial:,meter_accessible:,meter_present:,meter_stand_location:)
      meter_info = MeterInfo.new({zone_report_id: zone_report_id,
        dma_report_id: dma_report_id,
        meter_status_id: meter_status_id,
        meter_serial: meter_serial,
        meter_accessible: meter_accessible,
        meter_present: meter_present,
        meter_stand_location: meter_stand_location}.reject{ |k,v| v.blank?}
         )

      if meter_info.save
       
        {
          meter_info: meter_info,
          success: true,
          errors:  []
        }
        
      else
        
         { 
          meter_info: nil ,
          success: false,
          errors: meter_info.errors.messages
        }
        
      end
    end

  end
end
