class CreateConnectionInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :connection_infos, id: :uuid do |t|
      t.references :zone_report, type: :uuid, foreign_key: true
      t.references :dma_report, type: :uuid, foreign_key: true
      t.references :building_type_cartegory, type: :uuid, foreign_key: true
      t.references :building_info, type: :uuid, foreign_key: true
      t.boolean :labelled
      t.string :connection_number
      t.references :account_status, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
