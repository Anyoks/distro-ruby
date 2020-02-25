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
      description: "A list of all assignmets or tasks specific to a user." do
        argument :userId, String, required: true
    end

    field :departments, [Types::DepartmentType], null: false,
      description: "A list of all departments"
    
    field :subdepartments, [Types::SubdepartmentType], null: false,
      description: "A list of all subdepartments"

    field :positions, [Types::PositionType], null: false,
      description: "A list of all positions"

    # Geting Staff
    field :staffs, [Types::StaffType], null: false,
      description: "A list of all Staff"
    field :staff, Types::StaffType, null: false do
        argument :phone_number, String, required: true
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
    
    field :remarks, [Types::RemarkType], null: false,
      description: "A list of all Remarks"

    field :reports, [Types::ReportType],null: true,
      description: "A list of all Reports"
    
    field :myreports, [Types::ReportType], null: false,
      description: "A list of all reports specific to a user" do
        argument :userId, String, required: true
    end

    field :accountstatus, [Types::AccountStatusType],null: true,
      description: "A list of all Account Status"
    
    field :buildingtypes, [Types::BuildingTypeType],null: true,
      description: "A list of all Building Types"

    
    field :accounts_connection, Types::AccountType.connection_type, null: false,
      description: "A paginated list of nodes of accounts"

    field :zones,[Types::ZoneType], null: false,
      description: "A list of all Zone Types"

    field :dmas,[Types::DmaType], null: false,
      description: "A list of all Dma Types"

    field :zoneaccounts, [Types::AccountType],null: true,
      description: "A list of all Accounts in this zone" do 
        argument :zoneId, String, required: true
    end

    field :my_subdepartment, Types::SubdepartmentType, null: false,
      description: "A users's subdpartment" do
        argument :email, String, required: true
    end

    field :my_positions, [Types::PositionType], null: false,
      description: "Positions in A users's subdpartment" do
        argument :email, String, required: true
    end

    field :all_positions, [Types::PositionType], null: false,
      description: "All Positions " do
        argument :email, String, required: true
    end

    field :account_assignments, [Types::AssignmentType], null: false,
      description: "An account's assignment history" do
        argument :id, String, required: true
    end
    
    def accounts_connection(**_args)
      Account.all.includes(walkroute:[subzone:[:zone]])
    end

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
      # Account.all
      Account.all.includes(walkroute:[subzone:[:zone]])
    end

    def walkroutes
      Walkroute.all
    end

    def schemes
      Scheme.all
    end

    def assignments
      # Assignment.all.order("created_at DESC")
      Assignment.all.includes(:task, :staff, :stage, :account, :report).order("created_at DESC")
    end

    def myassignments(userId)
      # byebug
      # Assignment.where(user_id: userId[:user_id]).order("created_at DESC")
      Assignment.myassignments(userId[:user_id]).order("created_at DESC")
    end


    def account_assignments(id)
      # byebug
      # Assignment.where(user_id: userId[:user_id]).order("created_at DESC")
      Assignment.account_assignments(id[:id]).order("created_at DESC")
    end

    def departments 
      Department.all
    end

    def subdepartments
      Subdepartment.all
    end

    def positions
      Position.all.includes(:subdepartments, :staffs)
    end

    def all_positions
      Position.all
    end

    def staffs
      Staff.all
    end

    def staff(phone_number)
      # byebug
      #  Staff.find_by(phone_number: id[:id])
       Staff.find_by(phone_number)
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

    def remarks
      Remark.all
    end

    def reports
      Report.order("created_at DESC")
    end

    def myreports(userId)
      Report.myreports(userId[:user_id]).order("created_at DESC")
    end

    def accountstatus
      AccountStatus.all
    end

    def buildingtypes
      BuildingType.all
    end
    
    def zones
      Zone.order(:name)
    end

    def zoneaccounts(zoneId)
      zone = Zone.find(zoneId[:zone_id])
      zone.accounts
    end

    def my_subdepartment(email)
      user = User.find_by(email)
      sub = user.subdepartment
    end

    def my_positions(email)
      user = User.find_by(email)
      pos = user.subdepartment.positions
    end

    def dmas
      Dma.all.order("name ASC")
    end

  end
end
