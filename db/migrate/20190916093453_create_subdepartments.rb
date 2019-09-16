class CreateSubdepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :subdepartments, id: :uuid do |t|
      t.string :name
      t.string :description
      t.references :department, type: :uuid,  foreign_key: true

      t.timestamps
    end
  end
end
