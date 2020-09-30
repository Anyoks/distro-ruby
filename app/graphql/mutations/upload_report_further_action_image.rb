module Mutations
  class UploadReportFurtherActionImage < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    argument :image, ApolloUploadServer::Upload, required: true
    argument :report_further_action_id, String, required: true
  
    
    field :errors, String, null: false
    field :success, String, null: false
    field :id, String, null: false

    # TODO: define resolve method
    def resolve(image:, report_further_action_id:)
     
      report = ReportFurtherAction.find(report_further_action_id)
      #  byebug
      pic =   report.report_further_action_pictures.create!(picture: image )
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
