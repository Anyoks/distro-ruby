class AddSewerToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :old_account_number, :string
    add_column :accounts, :sewer, :string
    add_column :accounts, :water, :string
    add_column :accounts, :connection_status, :string
    add_column :accounts, :tariff, :string
    add_column :accounts, :building_type, :string
    add_column :accounts, :house_type, :string
    add_column :accounts, :house_units, :string
  end
end
