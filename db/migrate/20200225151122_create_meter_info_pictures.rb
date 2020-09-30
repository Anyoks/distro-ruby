class CreateMeterInfoPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :meter_info_pictures, id: :uuid do |t|
      t.references :meter_info, type: :uuid, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
