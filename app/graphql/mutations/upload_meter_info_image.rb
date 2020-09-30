module Mutations
  class UploadMeterInfoImage < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :image, ApolloUploadServer::Upload, required: true
    argument :meter_info_id, String, required: true
  
    
    field :errors, String, null: false
    field :success, String, null: false
    field :id, String, null: false

    # TODO: define resolve method
    def resolve(image:, meter_info_id:)
      # byebug
      meter_info = MeterInfo.find(meter_info_id)

      pic = meter_info.meter_info_pictures.create!(picture: image )
        if pic
          {
              id: pic.id,
              success: true
            }
        else
          {
             errors: pic.errors.full_messages,
             success: false
          }
        end
    end
  end
end
