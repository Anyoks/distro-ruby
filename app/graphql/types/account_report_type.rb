module Types
  class AccountReportType < Types::BaseObject
    field :id, String, null: false
    field :account_id, String, null: false
    field :further_action_id, String, null: false
    field :assignment_id, String, null: false
  end
end
