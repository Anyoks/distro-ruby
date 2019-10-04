module Types
  class ReportType < Types::BaseObject
    field :id, String, null: false
    field :completed, Boolean, null: false    
    field :comments, String, null: false
    field :furtherAction,Types::FurtherActionType, null: false
    field :assignment_id, String, null: false
    field :assignment, Types::AssignmentType, null: false
    # field :other_comment, String, null: true


    # def other_comment
    #   Other.create!()
    # end
    
  end
end
