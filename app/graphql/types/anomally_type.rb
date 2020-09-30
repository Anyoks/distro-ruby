module Types
  class AnomallyType < Types::BaseObject
    field :id, String, null: false
    field :zone_report_id, String, null: true
    field :dma_report_id, String, null: true
    field :meter_stand_problem_id, String, null: true
    field :meter_stand_problem, Types::MeterStandProblemType, null: true
    field :illegaluse_id, String, null: true
    field :illegaluse, Types::IllegaluseType, null: true
    field :labelled, String, null: true
    field :other_problem, String, null: true
    field :other_illegal_use, String, null: true
    field :illegal_use_image, String, null: true
    field :anomally_image, String, null: true
  end
end
