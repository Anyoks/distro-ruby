class AddUniqueConstraintToAssignmentId < ActiveRecord::Migration[5.2]
  def change
    # remove_index :report, :assignment_id
    change_column :reports, :assignment_id, :uuid, null: false

    remove_index :reports, :assignment_id
    add_index :reports, :assignment_id, unique: true
  end
end
