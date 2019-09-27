module Types
  class AssignmentType < Types::BaseObject
    field :id       , ID, null: false
    field :task   ,Types::TaskType, null: false 
    field :staff  ,Types::StaffType, null: false 
    field :stage  ,Types::StageType, null: false 
    field :account, Types::AccountType, null: false 
    field :comment ,String, null: false   
    
    # def stage
    #   object.stage.name
    # end
  end
end
