module Mutations
  class CreateBuildingInfo < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

  
  argument :single_rooms, String, required: true
  argument :bedsitters, String, required: true
  argument :one_bedrooms, String, required: true
  argument :two_bedrooms, String, required: true
  argument :three_bedrooms, String, required: true
  argument :floor_id, String, required: true
  argument :connection_info_id, String, required: true

  field :building_info, Types::BuildingInfoType, null: true
  field :errors, [String], null: false
  field :success, Boolean, null: false

    def resolve(single_rooms:,bedsitters:,one_bedrooms:,two_bedrooms:,three_bedrooms:,floor_id:,connection_info_id:)
      building_info = BuildingInfo.new({
        single_rooms: single_rooms,
        bedsitters: bedsitters,
        one_bedrooms: one_bedrooms,
        two_bedrooms: two_bedrooms,
        three_bedrooms: three_bedrooms,
        floor_id: floor_id,
        connection_info_id: connection_info_id}.reject{ |k,v| v.blank?}
      )

      if building_info.save
       
        {
          building_info: building_info,
          success: true,
          errors:  []
        }
        
      else
        
         { 
          building_info: nil ,
          success: false,
          errors: building_info.errors.full_messages
        }
        
      end
    end

  end
end
