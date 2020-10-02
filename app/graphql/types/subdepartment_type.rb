module Types
  class SubdepartmentType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :description, String, null: true
    field :department, Types::DepartmentType, null: true
    field :positions, [Types::PositionType], null: true
  end
end
