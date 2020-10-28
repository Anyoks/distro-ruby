module Mutations
  class CreateFormQuestionDatum < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    field :datum, [Types::FormQuestionDatumType], null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true
    
    # TODO: define arguments
    argument :form_questions_data, GraphQL::Types::JSON, required: true
    # argument :form_question_id, ID, required: true
    # argument :position, Integer, required: false

    # TODO: define resolve method
    def resolve(form_questions_data:)
      saved_form_question_data = []
      failed_form_question_data = []

      form_questions_data['data'].each do |datumx|
        # datum['data']
        # byebug
        datum = FormQuestionDatum.new({
          data: datumx['data'],
          form_question_id: datumx['form_question_id'],
        })

        if datum.save
          saved_form_question_data << datum
        else
          
          failed_form_question_data << datum
        end
      end

      errors = []
      failed_form_question_data.each do |data|
        errors << data.errors.messages
      end
      

      if failed_form_question_data.length > 0
        {
            datum: nil,
            success: false,
            errors:  errors
        }
      else
         {
            datum: saved_form_question_data,
            success: true,
            errors:  []
         }
      end
    end
  end
end
