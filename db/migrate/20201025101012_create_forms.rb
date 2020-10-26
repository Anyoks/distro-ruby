class CreateForms < ActiveRecord::Migration[5.2]
  def change
    create_table :forms, id: :uuid do |t|
      t.string :name
      t.string :description
      t.references :task,  type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
