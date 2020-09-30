module Mutations
  class CreateReportFurtherAction < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :zone_report_id, String, required: false
    argument :dma_report_id, String, required: false
    argument :account_report_id, String, required: false

    argument :relocate_meter, Boolean, required: true
    argument :raise_meter, Boolean, required: true
    argument :replace_meter, Boolean, required: true
    argument :action_taken, Boolean, required: true
    argument :disconnection_type, String , required: true
    argument :remark, String, required: true #, null: true
    argument :other, String, required: true #, null: true
    argument :repairs_done, String, required: true  #, null: true


    field :report_further_action, Types::ReportFurtherActionType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true

    # TODO: define resolve method
    def resolve(account_report_id:,zone_report_id:,dma_report_id:,relocate_meter:,raise_meter:,replace_meter:,action_taken:,remark:,other:,disconnection_type:,repairs_done:)
      report_further_action = ReportFurtherAction.new(
        {zone_report_id: zone_report_id,
          remark: remark,
          action_taken: action_taken,
          other: other,
          repairs_done: repairs_done,
        dma_report_id: dma_report_id,
        account_report_id: account_report_id,
        relocate_meter: relocate_meter,
        raise_meter: raise_meter,
        replace_meter: replace_meter,
      disconnection_type: disconnection_type}.reject{ |k,v| v.blank?}
        )

      if report_further_action.save
        {
          report_further_action: report_further_action,
          success: true,
          errors:  []
        }
      else
        { 
          report_further_action: nil,
          success: false,
          errors: report_further_action.errors.full_messages
        }
      end
    end
  end
end
