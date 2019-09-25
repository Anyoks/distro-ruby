module Types
  class PositionType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :desctription, String, null: true
    field :subdepartment, Types::SubdepartmentType, null: true
    field :staffs, [Types::StaffType], null: true
  end
end
