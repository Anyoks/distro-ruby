module Types
  class AnomallyType < Types::BaseObject
    field :id, String, null: false
    field :zone_report_id, String, null: true
    field :dma_report_id, String, null: true
    field :meter_stand_problem_id, String, null: false
    field :illegaluse_id, String, null: false
    field :labelled, String, null: false
    field :other_problem, String, null: false
    field :other_illegal_use, String, null: false
  end
end
