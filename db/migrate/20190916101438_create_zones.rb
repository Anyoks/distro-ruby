class CreateZones < ActiveRecord::Migration[5.2]
  def change
    create_table :zones, id: :uuid do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
