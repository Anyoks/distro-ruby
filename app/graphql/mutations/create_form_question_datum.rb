module Mutations
  class CreateFormQuestionDatum < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    field :datum, Types::FormQuestionDatumType, null: false

    # TODO: define arguments
    argument :data, GraphQL::Types::JSON, required: true
    argument :form_question_id, ID, required: true
    argument :position, Integer, required: false

    # TODO: define resolve method
    def resolve(data:, form_question_id:)
      datum = FormQuestionDatum.new({
        data: data,
        form_question_id: form_question_id,
        position: position
      })

      if datum.save
        {
            datum: datum,
            success: true,
            errors:  []
        }
      else
         {
            datum: null,
            success: true,
            errors:  datum.errors.messages
         }
      end
    end
  end
end
