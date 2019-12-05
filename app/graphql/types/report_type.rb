module Types
  class ReportType < Types::BaseObject
    field :id, String, null: false
    field :completed, Boolean, null: false    
    field :complete, String, null: false
    field :comments, String, null: false
    field :furtherAction,Types::FurtherActionType, null: false
    field :assignment_id, String, null: false
    field :assignment, Types::AssignmentType, null: false
    field :image, String, null: true
    field :date, String, null: false
    def image
      object.image_url
    end
  end
end
