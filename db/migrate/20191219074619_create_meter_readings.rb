class CreateMeterReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :meter_readings, id: :uuid do |t|
      t.string :previous
      t.string :current
      t.references :account, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
