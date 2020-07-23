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

    field :myDmaAssignments, [Types::DmaAssignmentType], null: false,
      description: "A list of all dma assignmets specific to a user." do
        argument :userId, String, required: true
    end
    
    field :myZoneAssignments, [Types::ZoneAssignmentType], null: false,
      description: "A list of all Zone assignmets specific to a user." do
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

    # Meter infor
    field :acc_meter_info, Types::MeterInfoType, null: true,
     description: "Get connection details for a particular acc report" do
        argument :accountReportId, String, required: true
    end

    # Get account details/info for a particular zone report
    field :acc_connection_info, Types::ConnectionInfoType, null: true,
     description: "Get account report info for a particular acc report" do
        argument :accountReportId, String, required: true
    end

    field :zone_connection_info, Types::ConnectionInfoType, null: true,
     description: "Get connection details for a particular zone report" do
        argument :zoneReportId, String, required: true
    end

    field :dma_connection_info, Types::ConnectionInfoType, null: true,
     description: "Get connection details for a particular dma report" do
        argument :dmaReportId, String, required: true
    end

    field :acc_report_anomaly, Types::AnomallyType, null: true,
     description: "get anomalies for acc report" do
        argument :accountReportId, String, required: true
    end

    field :dma_report_anomaly, Types::AnomallyType, null: true,
     description: "get anomalies for dma report" do
        argument :dmaReportId, String, required: true
    end

    field :zone_report_anomaly, Types::AnomallyType, null: true,
     description: "get anomalies for zone report" do
        argument :zoneReportId, String, required: true
    end

    field :dma_report_bursts_and_leaks, Types::BurstAndLealageType, null: true,
     description: "get bursts and leaks for dma report" do
        argument :dmaReportId, String, required: true
    end
    field :zone_report_bursts_and_leaks, Types::BurstAndLealageType, null: true,
     description: "get bursts and leaks for zone report" do
        argument :zoneReportId, String, required: true
    end

    field :acc_report_further_action, Types::ReportFurtherActionType, null: true, 
     description: "get acc report further action details" do
      argument :accountReportId, String, required: true
    end

    field :dma_report_further_action, Types::ReportFurtherActionType, null: true, 
     description: "get dma report further action details" do
      argument :dmaReportId, String, required: true
    end

    field :zone_report_further_action, Types::ReportFurtherActionType, null: true, 
    description: "get zone report further action details" do
      argument :zoneReportId, String, required: true
    end

    field :stages, [Types::StageType], null: false,
      description: "A list of all stages, has option for stage details for particular user"
    
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

    field :reports, [Types::AccountReportType],null: true,
      description: "A list of all Reports"
    
    field :myreports, [Types::AccountReportType], null: true,
      description: "A list of all reports specific to a user" do
        argument :userId, String, required: true
    end

    field :myzonereports, [Types::ZoneReportType], null: false,
      description: "A list of all zone reports specific to a user" do
        argument :userId, String, required: true
    end

    field :mydmareports, [Types::DmaReportType], null: false,
      description: "A list of all dma reports specific to a user" do
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
# from here
    field :pipesize,[Types::PipesizeType], null: false,
      description: "A list of all Pipe Sizes Types"

    field :pipematerial,[Types::PipematerialType], null: false,
      description: "A list of all Pipe Sizes Types"

    field :illegaluse,[Types::IllegaluseType], null: false,
      description: "A list of all Illegal use Types"

    field :meter_stand_problem,[Types::MeterStandProblemType], null: false,
      description: "A list of all Meter stand problem Types"
    
    field :bulk_meters,[Types::BulkMeterType], null: false,
      description: "A list of all Bulk meter Types"

    field :floors,[Types::FloorType], null: false,
      description: "A list of all Floor Types"

    field :meter_status,[Types::MeterStatusType], null: false,
      description: "A list of all Meter Status Types"

    field :building_type_cartegories,[Types::BuildingTypeCartegoryType], null: false,
      description: "A list of all Building Types"

    field :tenants,[String], null: false,
      description: "A list of all availble subdomains/tenants"
    
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

    def my_dma_assignments(userId)
      # byebug
      # Assignment.where(user_id: userId[:user_id]).order("created_at DESC")
      DmaAssignment.myassignments(userId[:user_id]).order("created_at DESC")
    end
    def my_zone_assignments(userId)
      # byebug
      # Assignment.where(user_id: userId[:user_id]).order("created_at DESC")
      ZoneAssignment.myassignments(userId[:user_id]).order("created_at DESC")
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

    def acc_connection_info(id)
      # id is the acc report id
      ConnectionInfo.find_by(id)
      # byebug
    end

    def acc_meter_info(id)
      # id is the acc report id
      MeterInfo.find_by(id)
    end

    def zone_connection_info(id)
      ConnectionInfo.find_by(id)
      # byebug
    end

    def dma_connection_info(id)
      ConnectionInfo.find_by(id)
      # byebug
    end

    def acc_report_anomaly(id)
      Anomally.find_by(id)
    end

    def dma_report_anomaly(id)
      Anomally.find_by(id)      
    end   

    def zone_report_anomaly(id)
      Anomally.find_by(id)      
    end 

    def dma_report_bursts_and_leaks(id)
      BurstAndLealage.find_by(id)
    end

    def zone_report_bursts_and_leaks(id)
      BurstAndLealage.find_by(id)
    end

    def acc_report_further_action(id)
      ReportFurtherAction.find_by(id)
    end

    def dma_report_further_action(id)
      ReportFurtherAction.find_by(id)
    end

    def zone_report_further_action(id)
      ReportFurtherAction.find_by(id)
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
      AccountReport.order("created_at DESC")
    end

    def myreports(userId)
      AccountReport.myreports(userId[:user_id]).order("created_at DESC")
    end
  
    def myzonereports(userId)
      ZoneReport.myreports(userId[:user_id]).order("created_at DESC")
    end

    def mydmareports(userId)
      DmaReport.myreports(userId[:user_id]).order("created_at DESC")
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

    def pipesize
      Pipesize.all.order("name ASC")
    end

    def pipematerial
      Pipematerial.all.order("name ASC")
    end

    def illegaluse
      Illegaluse.all.order("name ASC")
    end

    def meter_stand_problem
      MeterStandProblem.all.order("name ASC")
    end


    def bulk_meters
      BulkMeter.all.order("name ASC")
    end


    def floors
      Floor.all.order("name ASC")
    end


    def meter_status
      MeterStatus.all.order("name ASC")
    end

    def building_type_cartegories
      BuildingTypeCartegory.all.order("name ASC")
    end

    def tenants
      Apartment.tenant_names
    end

  end
end
