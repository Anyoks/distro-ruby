module Mutations
  class UploadDatumFile < GraphQL::Schema::RelayClassicMutation
    argument :file, ApolloUploadServer::Upload, required: true
    argument :form_question_datum_id, String, required: true
    argument :file_type, String, required: true
  
    
    field :errors, String, null: false
    field :success, String, null: false
    field :id, String, null: false

    # TODO: define resolve method
    def resolve(file:, form_question_datum_id:,file_type:)
      # byebug
      datum = FormQuestionDatum.find(form_question_datum_id)

      # add sidekiq worker.
      file = datum.form_question_datum_file.create!(file: file, file_type: file_type )
        if file
          {
            id: file.id,
            success: true
            # return file link
          }
        else
          {
            errors: file.errors.full_messages,
            success: false
          }
        end
    end
  end
end
