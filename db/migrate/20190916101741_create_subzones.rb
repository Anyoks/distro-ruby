class CreateSubzones < ActiveRecord::Migration[5.2]
  def change
    create_table :subzones, id: :uuid do |t|
      t.string :name
      t.string :description
      t.references :zone, type: :uuid,  foreign_key: true

      t.timestamps
    end
  end
end
