class RenameMeterSerialToMeterSerail < ActiveRecord::Migration[5.2]
  def change
    rename_column :accounts, :meterSerial, :meter_serial
  end
end
