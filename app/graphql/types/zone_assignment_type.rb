module Types
  class ZoneAssignmentType < Types::BaseObject
    field :id       , String, null: false
    field :task   ,Types::TaskType, null: false 
    field :staff  ,Types::StaffType, null: false 
    field :stage  ,Types::StageType, null: false 
    field :zone, Types::ZoneType, null: false 
    field :desc, String, null: false 
    field :stageName  ,String, null: false 
    
    field :date, String, null: false


    def stage_name
      object.stage.name
    end
  end
end
