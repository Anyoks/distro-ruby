module Types
  class DepartmentType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :description, String, null: true
    field :subdepartments, [Types::SubdepartmentType], null: true
    
  end
end
