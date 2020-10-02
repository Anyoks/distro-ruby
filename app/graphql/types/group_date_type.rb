module Types
  class GroupDateType < Types::BaseObject
    field :date, String, null: false
    field :total, Integer, null: false
  end
end
