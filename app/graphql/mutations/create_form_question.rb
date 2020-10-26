module Mutations
  class CreateFormQuestion < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    field :question, Types::FormQuestionType, null: false

    # TODO: define arguments
    argument :query, String, required: true
    argument :position, Int, required: true
    argument :response_type, String, required: true
    argument :options, GraphQL::Types::JSON, required: false


    # TODO: define resolve method
    def resolve(query:,position:,response_type:,options:)
      question = FormQuestion.new({
        query: query,
        position: position,
        response_type: response_type,
        options: options
      })

      if question.save
        {
            question: question,
            success: true,
            errors:  []
          }
      else
        {
          question: null,
          success: true,
          errors:  question.errors.messages
        }
      end
    end
  end
end
