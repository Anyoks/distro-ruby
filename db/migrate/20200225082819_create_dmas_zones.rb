class CreateDmasZones < ActiveRecord::Migration[5.2]
  def change
    create_table :dmas_zones, :id => false do |t|
      t.uuid :zone_id, type: :uuid,foreign_key: true
      t.uuid :dma_id, type: :uuid,foreign_key: true

      t.timestamps
    end
  end
end
