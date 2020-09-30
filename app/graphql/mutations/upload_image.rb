module Mutations
  class UploadImage < GraphQL::Schema::RelayClassicMutation

    argument :image, ApolloUploadServer::Upload, required: true
    argument :report_id, String, required: true
  
    
    field :errors, String, null: false
    field :id, String, null: false

    # TODO: define resolve method
    def resolve(image:, report_id:)
      # byebug
      report = Report.find(report_id)

      pic = report.pictures.create!(picture: image )
        if pic
          {
              id: pic.id,
              # other: nil,
              # picture: 'yes',
              # errors: [],
            }
        else
          {
             errors: pic.errors.full_messages
          }
        end
    end
  end
end
