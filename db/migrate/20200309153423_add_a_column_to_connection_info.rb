class AddAColumnToConnectionInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :connection_infos, :name, :string
  end
end
