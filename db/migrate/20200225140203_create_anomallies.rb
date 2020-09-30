class CreateAnomallies < ActiveRecord::Migration[5.2]
  def change
    create_table :anomallies, id: :uuid do |t|
      t.references :zone_report, type: :uuid, foreign_key: true
      t.references :dma_report, type: :uuid, foreign_key: true
      t.references :meter_stand_problem, type: :uuid, foreign_key: true
      t.references :illegaluse, type: :uuid, foreign_key: true
      t.boolean :labelled
      t.string :other_problem

      t.timestamps
    end
  end
end
