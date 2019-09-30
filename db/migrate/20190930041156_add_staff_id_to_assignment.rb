class AddStaffIdToAssignment < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :staff_id, :uuid, null: false
  end
end
