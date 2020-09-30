class AddConstraintToSubdepartmentsTasks < ActiveRecord::Migration[5.2]
  def change
    # subdepartments_tasks
    add_index :subdepartments_tasks, [:subdepartment_id, :task_id], :unique => true
  end
end
