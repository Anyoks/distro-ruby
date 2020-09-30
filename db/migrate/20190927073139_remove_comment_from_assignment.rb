class RemoveCommentFromAssignment < ActiveRecord::Migration[5.2]
  def change
    remove_column :assignments, :comment, :string
  end
end
