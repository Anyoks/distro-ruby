module Types
  class ReportType < Types::BaseObject
    field :id, String, null: false
    field :completed, Boolean, null: false    
    field :complete, String, null: false
    field :comments, String, null: false
    field :furtherAction,Types::FurtherActionType, null: false
    field :assignment_id, String, null: false
    field :assignment, Types::AssignmentType, null: false
  end
end
