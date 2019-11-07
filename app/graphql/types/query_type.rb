module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"

      # field :users, [Types::UserType], null: false
    field :accounts, [Types::AccountType],null: false, 
      description: "A list of all accounts"
    field :walkroutes,[Types::WalkrouteType], null: false,
      description: "A list of all Walkroutes"
    
    field :schemes, [Types::SchemeType], null: false,
      description: "A list of all schemes"  

    field :assignments, [Types::AssignmentType], null: false,
      description: "A list of all assignmets or jobs"
    
    field :myassignments, [Types::AssignmentType], null: false,
      description: "A list of all assignmets or tasks specific to a user" do
        argument :userId, String, required: true
    end

    field :departments, [Types::DepartmentType], null: false,
      description: "A list of all departments"
    
    field :subdpartments, [Types::SubdepartmentType], null: false,
      description: "A list of all subdepartments"

    field :positions, [Types::PositionType], null: false,
      description: "A list of all positions"

    # Geting Staff
    field :staffs, [Types::StaffType], null: false,
      description: "A list of all Staff"
    field :staff, Types::StaffType, null: false do
        argument :id, String, required: true
    end

    field :stages, [Types::StageType], null: false,
      description: "A list of all stages"

    # field :mystages, [Types::StageType], null: false,
    #   description: "A list of all stages with totals"
    #   do
    #     argument :userId, String, required: false
    # end

    field :subzones, [Types::SubzoneType], null: false,
      description: "A list of all subzones"

    field :tasks, [Types::TaskType], null: false,
      description: "A list of all tasks"

    field :mytasks, [Types::TaskType], null: false,
      description: "A list of all tasks specific to a user" do
        argument :userId, String, required: true
    end

    field :users, [Types::UserType], null: false,
      description: "A list of all users"

    field :role, [Types::RoleType], null: false,
      description: "A list of all role"

    field :furtheractions, [Types::FurtherActionType], null: false,
      description: "A list of all further actions"

    field :reports, [Types::ReportType],null: true,
      description: "A list of all Reports"

    def test_field
      "Hello World!"
    end

    # field :account, [Types::AccountType], null: false do
    #   argument :id, UUID, required: true
    # end

    # def account(id:)
    #   Account.find(id)
    # end

    def accounts
      Account.all
    end

    def walkroutes
      Walkroute.all
    end

    def schemes
      Scheme.all
    end

    def assignments
      Assignment.all.order("created_at DESC")
    end

    def myassignments(userId)
      # byebug
      Assignment.where(user_id: userId[:user_id]).order("created_at DESC")
    end

    def departments 
      Department.all
    end

    def subdpartments
      Subdepartment.all
    end

    def positions
      Position.all
    end

    def staffs
      Staff.all
    end

    def staff(id)
      # byebug
      Staff.find(id[:id])
    end

    def stages      
      Stage.all
    end

    def subzones
      Subzone.all
    end

    def tasks
      Task.all.order("created_at DESC")
    end

    def mytasks(userId)
      # byebug
      Task.mytasks(userId[:user_id]).order("created_at DESC")
    end

    def users
      User.all
    end

    def roles
      Role.all
    end

    def furtheractions
      FurtherAction.all
    end

    def reports
      Report.all
    end

  end
end
