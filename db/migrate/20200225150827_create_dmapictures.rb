class CreateDmapictures < ActiveRecord::Migration[5.2]
  def change
    create_table :dmapictures, id: :uuid do |t|
      t.references :dma_report,  type: :uuid, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
