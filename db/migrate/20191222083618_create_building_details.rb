class CreateBuildingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :building_details, id: :uuid do |t|
      t.string :name
      t.string :description
      t.references :building_type_cartegory, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
