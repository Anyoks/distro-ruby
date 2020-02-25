class CreateBurstPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :burst_pictures, id: :uuid do |t|
      t.references :burst_and_lealage, type: :uuid, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
