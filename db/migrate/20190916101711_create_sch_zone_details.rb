class CreateSchZoneDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :sch_zone_details, id: :uuid do |t|
      t.references :scheme, type: :uuid, foreign_key: true
      t.references :zone, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
