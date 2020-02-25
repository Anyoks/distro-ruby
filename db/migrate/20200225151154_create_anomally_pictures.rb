class CreateAnomallyPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :anomally_pictures, id: :uuid do |t|
      t.references :anomally, type: :uuid, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
