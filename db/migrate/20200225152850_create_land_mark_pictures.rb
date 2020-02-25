class CreateLandMarkPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :land_mark_pictures, id: :uuid do |t|
      t.references :burst_and_lealages,  type: :uuid,foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
