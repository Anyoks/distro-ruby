class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments, id: :uuid do |t|
      t.references :task,  type: :uuid, foreign_key: true
      t.references :staff,  type: :uuid, foreign_key: true
      t.references  :stage,  type: :uuid, foreign_key: true
      t.references :account,  type: :uuid, foreign_key: true
      t.string :comment 

      t.timestamps
    end
  end
end
