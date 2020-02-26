module Mutations
  class CreateBurstAndLeaks < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :zone_report_id, String, required: false
    argument :dma_report_id, String, required: false
    argument :pipematerial_id, String, required: true
    argument :pipesize_id, String, required: true
    argument :surrounding_area, String, required: false
    argument :remarks, String, required: false

    field :burst_and_lealage, Types::BurstAndLealageType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: false


    def resolve(zone_report_id:,dma_report_id:,pipematerial_id:,pipesize_id:,surrounding_area:,remarks:)
      burst_and_lealage = BurstAndLealage.new({
       zone_report_id: zone_report_id,
       dma_report_id: dma_report_id,
       pipematerial_id: pipematerial_id,
       pipesize_id: pipesize_id,
       surrounding_area: surrounding_area,
       remarks: remarks}.reject{ |k,v| v.blank?}
      )

      if burst_and_lealage.save
       
        {
          burst_and_lealage: burst_and_lealage,
          success: true,
          errors:  []
        }
        
      else
        
         { 
          burst_and_lealage: nil ,
          success: false,
          errors: burst_and_lealage.errors.full_messages
        }
        
      end
    end
  end
end
