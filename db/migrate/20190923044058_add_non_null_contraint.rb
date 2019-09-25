class AddNonNullContraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null :assignments, :task_id, false
    change_column_null :assignments, :account_id, false
    change_column_null :assignments, :stage_id, false
    change_column_null :assignments, :staff_id, false
  end
end
