module Types
  class FormQuestionDatumType < Types::BaseObject
    field :id, ID, null: false
    field :position, Integer, null: true
    field :data, GraphQL::Types::JSON, null: false
  end
end
