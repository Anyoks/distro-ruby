module Mutations
  class CreateDmaReport < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    
    argument :scheme_id, String, required: true
    argument :dma_id, String, required: true
    argument :bulk_meter_id, String, required: true
    argument :further_action_id, String, required: true
    argument :dma_assignment_id, String, required: true
    

    field :dma_report, Types::DmaReportType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true

    # TODO: define resolve method
    def resolve(scheme_id:,dma_id:,bulk_meter_id:,further_action_id:,dma_assignment_id:)
      dma_report = DmaReport.new(scheme_id: scheme_id, dma_id: dma_id, bulk_meter_id: bulk_meter_id,
         further_action_id: further_action_id, dma_assignment_id: dma_assignment_id )

      if dma_report.save
        {
          dma_report: dma_report,
          success: true,
          errors:  []
        }
      else
        { 
          dma_report: nil,
          success: false,
          errors: dma_report.errors.messages
        }
      end
    end
  end
end
