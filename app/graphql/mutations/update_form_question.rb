module Mutations
  class UpdateFormQuestion < GraphQL::Schema::RelayClassicMutation
    field :form_question, Types::FormQuestionType, null: true
    field :errors, [String], null: true
    field :success, Boolean, null: true

    # TODO: define arguments
    argument :query, String, required: true
    argument :form_question_id, String, required: true
    argument :position, Int, required: true
    argument :response_type, String, required: true
    argument :options, GraphQL::Types::JSON, required: false
    argument :form_id, String, required: true
      # TODO: define resolve method
    def resolve(query:,position:,response_type:,options:,form_id:,form_question_id:)
       
      question = FormQuestion.find(form_question_id)
       
      if question.present?
         question.update_attributes({
            form_id: form_id,
            query: query,
            position: position,
            response_type: response_type,
            options: options
          })

        {
          form_question: question,
          success: true,
          errors:  []
        }
      else
         {
          question: nil,
          success: true,
          errors:  question.errors.messages
        }
      end
     
    end
  end
end
