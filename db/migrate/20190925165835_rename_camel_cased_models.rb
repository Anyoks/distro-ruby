class RenameCamelCasedModels < ActiveRecord::Migration[5.2]
  def change
    rename_column :staffs, :firstName, :first_name
    rename_column :staffs, :lastName, :last_name
    rename_column :staffs, :phoneNumber, :phone_number
    rename_column :users, :firstName, :first_name
    rename_column :users, :secondName, :last_name
  end
end
