class CreateZonepictures < ActiveRecord::Migration[5.2]
  def change
    create_table :zonepictures, id: :uuid do |t|
      t.references :zone_report,  type: :uuid, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
