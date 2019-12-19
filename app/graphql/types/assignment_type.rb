module Types
  class AssignmentType < Types::BaseObject
    field :id       , String, null: false
    field :task   ,Types::TaskType, null: false 
    field :staff  ,Types::StaffType, null: false 
    field :stage  ,Types::StageType, null: false 
    field :account, Types::AccountType, null: false 
    field :comment ,String, null: false   
    field :stageName  ,String, null: false 
    field :report, Types::ReportType, null: true
    field :date, String, null: false
    
    def stage_name
      object.stage.name
    end
  end
end
