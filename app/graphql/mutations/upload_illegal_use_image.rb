module Mutations
  class UploadIllegalUseImage < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :image, ApolloUploadServer::Upload, required: true
    argument :anomally_id, String, required: true
  
    
    field :errors, String, null: false
    field :success, String, null: false
    field :id, String, null: false

    # TODO: define resolve method
    def resolve(image:, anomally_id:)
      # byebug
      anomally = Anomally.find(anomally_id)

      pic = anomally.illegal_use_pictures.create!(picture: image )
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
