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
    
    field :departments, [Types::DepartmentType], null: false,
      description: "A list of all departments"
    
    field :subdpartments, [Types::SubdepartmentType], null: false,
      description: "A list of all subdepartments"

    field :positions, [Types::PositionType], null: false,
      description: "A list of all positions"

    field :staff, [Types::StaffType], null: false,
      description: "A list of all Staff"

    field :stages, [Types::StageType], null: false,
      description: "A list of all stages"

    field :subzones, [Types::SubzoneType], null: false,
      description: "A list of all subzones"

    field :tasks, [Types::TaskType], null: false,
      description: "A list of all tasks"

    field :users, [Types::UserType], null: false,
      description: "A list of all users"

    field :role, [Types::RoleType], null: false,
      description: "A list of all role"

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
      Assignment.all
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

    def staff
      Staff.all
    end

    def stages
      Stage.all
    end

    def subzones
      Subzone.all
    end

    def tasks
      Task.all
    end

    def users
      User.all
    end

    def roles
      Role.all
    end

  end
end
