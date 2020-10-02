class CreateZoneReports < ActiveRecord::Migration[5.2]
  def change
    create_table :zone_reports, id: :uuid do |t|
      t.references :scheme, type: :uuid, foreign_key: true
      t.references :zone, type: :uuid, foreign_key: true
      t.references :bulk_meter, type: :uuid, foreign_key: true
      t.references :zone_assignment,type: :uuid,  foreign_key: true

      t.timestamps
    end
  end
end
