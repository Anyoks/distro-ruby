class AddMeterReadingToReport < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :meter_reading, :string
  end
end
