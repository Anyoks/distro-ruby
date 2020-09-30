class AddSubdepartmentToTask < ActiveRecord::Migration[5.2]
  def change
    # add_column :tasks, :subdepartment_id, :uuid, null: false #,  :default => Remark.find_or_create_by(name: "by pass").id
    # add_index :tasks, :subdepartment_id
  end
end
