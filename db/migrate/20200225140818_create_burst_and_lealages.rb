class CreateBurstAndLealages < ActiveRecord::Migration[5.2]
  def change
    create_table :burst_and_lealages, id: :uuid do |t|
      t.references :zone_report, type: :uuid, foreign_key: true
      t.references :dma_report, type: :uuid, foreign_key: true
      t.references :pipematerial, type: :uuid, foreign_key: true
      t.references :pipesize, type: :uuid, foreign_key: true
      t.string :surrounding_area
      t.string :remarks

      t.timestamps
    end
  end
end
