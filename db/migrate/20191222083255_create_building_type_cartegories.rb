class CreateBuildingTypeCartegories < ActiveRecord::Migration[5.2]
  def change
    create_table :building_type_cartegories, id: :uuid do |t|
      t.string :name
      t.string :description
      t.references :building_type, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
