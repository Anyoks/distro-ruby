class CreateBuildingInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :building_infos, id: :uuid do |t|
      t.integer :single_rooms
      t.integer :bedsitters
      t.integer :one_bedrooms
      t.integer :two_bedrooms
      t.integer :three_bedrooms
      t.references :floors, type: :uuid,foreign_key: true

      t.timestamps
    end
  end
end
