class CreateZoneAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :zone_assignments, id: :uuid do |t|
      t.references :zone,    type: :uuid, foreign_key: true
      t.references :task,    type: :uuid, foreign_key: true
      t.references :user,    type: :uuid, foreign_key: true
      t.references :staff,   type: :uuid,  foreign_key: true
      t.references :stage,   type: :uuid,  foreign_key: true

      t.timestamps
    end
  end
end
