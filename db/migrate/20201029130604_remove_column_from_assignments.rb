class RemoveColumnFromAssignments < ActiveRecord::Migration[5.2]
  def change
    remove_column :assignments, :account_id, :string
    add_column :form_question_data, :assignment_id, :string,  null: false

    add_index :form_question_data, :assignment_id
  end
end
