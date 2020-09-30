class AddSubdepartmentToUser < ActiveRecord::Migration[5.2]
  def change
    # add_column :users, :references, :subdepartment
    add_column :users, :subdepartment_id, :uuid, null: false, :default => Subdepartment.first.id
  end
end
