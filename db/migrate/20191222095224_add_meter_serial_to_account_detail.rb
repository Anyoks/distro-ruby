class AddMeterSerialToAccountDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :account_details, :meter_serial, :string
  end
end
