module Types
  class RemarkType < Types::BaseObject
    # id          :uuid             not null, primary key
#  name        :string
#  description :string
    field :id, String, null: false
    field :name, String, null: true
    field :description, String, null: true
  end
end
