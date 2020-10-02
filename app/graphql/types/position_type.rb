module Types
  class PositionType < Types::BaseObject
    field :id, String, null: true
    field :name, String, null: true
    field :description, String, null: true
    field :subdepartments,[ Types::SubdepartmentType], null: true
    field :staffs, [Types::StaffType], null: true
  end
end
