class CreateOrgData < ActiveRecord::Migration[5.2]
  def change
    create_table :org_data, id: :uuid do |t|
      t.string :name
      t.jsonb :data, null: false, default: '{}'

      t.timestamps
    end
    add_index  :org_data, :data, using: :gin
  end
end
