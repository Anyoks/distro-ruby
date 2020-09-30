module Mutations
  class CreateConnectionInfo < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    
    argument :zone_report_id, String, required: false
    argument :dma_report_id, String, required: false
    argument :account_report_id, String, required: false
    argument :building_type_cartegory_id, String, required: true
    argument :name, String, required: true
    argument :connection_number, String, required: true
    argument :account_status_id, String, required: true

    field :connection_info, Types::ConnectionInfoType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true


    def resolve(zone_report_id:,dma_report_id:,building_type_cartegory_id:,connection_number:,account_status_id:,account_report_id:,name:)
       connection_info = ConnectionInfo.new({zone_report_id: zone_report_id,
        dma_report_id: dma_report_id,
        account_report_id: account_report_id,
        building_type_cartegory_id: building_type_cartegory_id,
        name: name,
        connection_number: connection_number,
        account_status_id: account_status_id}.reject{ |k,v| v.blank?}
         )

      if  connection_info.save
       
        {
          connection_info:  connection_info,
          success: true,
          errors:  []
        }
        
      else
        
        { 
          connection_info: nil ,
          success: false,
          errors:  connection_info.errors.full_messages
        }
        
      end
    end

    
  end
end
