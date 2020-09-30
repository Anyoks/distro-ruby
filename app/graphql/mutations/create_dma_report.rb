module Mutations
  class CreateDmaReport < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

  
    argument :scheme_id, String, required: true
    argument :bulk_meter_id, String, required: true
    argument :dma_assignment_id, String, required: true
    argument :section, String, required: true
    argument :latitude, Float, required: false
    argument :longitude, Float, required: false
    argument :accuracy, Float, required: false
    argument :altitude, Float, required: false

    field :dma_report, Types::DmaReportType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true

    # TODO: define resolve method
    def resolve(scheme_id:,bulk_meter_id:,dma_assignment_id:,latitude:,longitude:,accuracy:,altitude:,section:)
      dma_report = DmaReport.new({scheme_id: scheme_id,  bulk_meter_id: bulk_meter_id,
          dma_assignment_id: dma_assignment_id,
          longitude: longitude, latitude:latitude, accuracy: accuracy, altitude:altitude, section: section}.reject{ |k,v| v.blank?} )

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
          errors: dma_report.errors.full_messages
        }
      end
    end
  end
end
