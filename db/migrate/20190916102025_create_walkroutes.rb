class CreateWalkroutes < ActiveRecord::Migration[5.2]
  def change
    create_table :walkroutes, id: :uuid do |t|
      t.string :name
      t.string :description
      t.references :subzone, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
