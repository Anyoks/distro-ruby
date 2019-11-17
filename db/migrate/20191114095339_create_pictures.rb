class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures, id: :uuid do |t|
      t.references :report, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
