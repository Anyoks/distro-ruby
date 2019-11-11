module Types
  class FurtherActionType < Types::BaseObject
    field :id, String, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :other, Types::OtherType, null: true
  end
end
