class RemoveColumnSubdepartmentIdFromPositions < ActiveRecord::Migration[5.2]
  def change
    remove_column :positions, :subdepartment_id, :uuid
  end
end
