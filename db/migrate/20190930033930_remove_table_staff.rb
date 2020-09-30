class RemoveTableStaff < ActiveRecord::Migration[5.2]
  def change
    remove_column :assignments, :staff_id, :uuid
    drop_table :staffs
  end
end
