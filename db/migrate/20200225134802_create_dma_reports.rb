class CreateDmaReports < ActiveRecord::Migration[5.2]
  def change
    create_table :dma_reports, id: :uuid do |t|
      t.references :scheme, type: :uuid, foreign_key: true
      t.references :dma, type: :uuid, foreign_key: true
      t.references :bulk_meter,type: :uuid, foreign_key: true
      t.references :dma_assignment,type: :uuid,  foreign_key: true

      t.timestamps
    end
  end
end
