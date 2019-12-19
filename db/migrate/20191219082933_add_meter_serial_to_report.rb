class AddMeterSerialToReport < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :meter_serial, :string
  end
end
