module Types
  class BurstAndLealageType < Types::BaseObject
    field :id, String, null: false
    field :zone_report_id, String, null: true
    field :dma_report_id, String, null: true
    field :pipematerial_id, String, null: false
    field :pipematerial, Types::PipematerialType, null: false
    field :pipesize_id, String, null: false
    field :pipesize, Types::PipesizeType, null: false
    field :surrounding_area, String, null: true
    field :remarks, String, null: true
    field :burst_image , String, null: true
    field :landmark_image , String, null: true
  end
end
