class AddUserIdToAssignments < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :user_id, :uuid, null: false, :default => User.first.id
  end
end
