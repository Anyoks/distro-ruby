module Types
  class FormQuestionType < Types::BaseObject
    field :id, ID, null: false
    field :query, String, null: false
    field :response_type, String, null: false
    field :position, Integer, null: false
    field :options, GraphQL::Types::JSON, null: false
    field :form_question_datum, [Types::FormQuestionDatumType], null: true
  end
end
