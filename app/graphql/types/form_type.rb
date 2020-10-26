module Types
  class FormType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description,  String, null: true
    field :form_questions, [Types::FormQuestionType], null: true
  end
end
