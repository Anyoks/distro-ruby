class CreateMeterInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :meter_infos, id: :uuid do |t|
      t.references :zone_report, type: :uuid, foreign_key: true
      t.references :dma_report, type: :uuid, foreign_key: true
      t.references :meter_status, type: :uuid, foreign_key: true
      t.string :meter_serial
      t.string :meter_reading
      t.boolean :meter_accessible
      t.string :meter_present
      t.string :meter_stand_location

      t.timestamps
    end
  end
end
