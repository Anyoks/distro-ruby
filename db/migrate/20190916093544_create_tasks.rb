class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks, id: :uuid do |t|
      t.string :name
      t.string :description
      t.references :subdepartment, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
