module Mutations
  class CreateAnomally < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, required: false

    
    argument :zone_report_id, String, required: false
    argument :dma_report_id, String, required: false
    argument :meter_stand_problem_id, String, required: true
    argument :illegaluse_id, String, required: true
    argument :labelled, String, required: true
    argument :other_problem, String, required: true

    field :anomally, Types::AnomallyType, null: true
    field :errors, [String], null: false
    field :success, Boolean, null: false

    def resolve(zone_report_id:,dma_report_id:,meter_stand_problem_id:,illegaluse_id:,labelled:,other_problem:)
      anomally = Anomally.new({zone_report_id: zone_report_id,
        dma_report_id: dma_report_id,
        meter_stand_problem_id: meter_stand_problem_id,
        illegaluse_id: illegaluse_id,
        labelled: labelled,
        other_problem: other_problem}.reject{ |k,v| v.blank?}
      )

      if anomally.save
       
        {
          anomally: anomally,
          success: true,
          errors:  []
        }
        
      else
        
         { 
          anomally: nil ,
          success: false,
          errors: anomally.errors.full_messages
        }
        
      end
    end
  end
end
