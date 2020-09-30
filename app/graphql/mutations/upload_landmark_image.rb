module Mutations
  class UploadLandmarkImage < GraphQL::Schema::RelayClassicMutation
    
    argument :image, ApolloUploadServer::Upload, required: true
    argument :burst_and_lealage_id, String, required: true
  
    
    field :errors, String, null: false
    field :success, String, null: false
    field :id, String, null: false

    # TODO: define resolve method
    def resolve(image:, burst_and_lealage_id:)
     
      burst = BurstAndLealage.find(burst_and_lealage_id)
      #  byebug
      pic =   burst.land_mark_pictures.create!(picture: image )
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
