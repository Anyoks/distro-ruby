class RemoveSubdepartmentIdFromTask < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :subdepartment_id, :uuid
  end
end
