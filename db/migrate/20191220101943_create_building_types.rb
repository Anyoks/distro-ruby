class CreateBuildingTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :building_types, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
