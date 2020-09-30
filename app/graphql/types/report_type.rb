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
    field :stageName, String, null: false
    field :building_type, String, null: true
    field :account_status, String, null: true
    field :remarks, String, null: true
    field :current_reading, String, null: true
    field :previous_reading, String, null: true
    def image
      object.image_url
    end
  end
end
