class CreateReportFurtherActions < ActiveRecord::Migration[5.2]
  def change
    create_table :report_further_actions, id: :uuid do |t|
      t.references :zone_report,  type: :uuid, foreign_key: true
      t.references :dma_report,  type: :uuid, foreign_key: true
      t.references :account_report,  type: :uuid, foreign_key: true
      t.boolean :relocate_meter
      t.boolean :raise_meter
      t.boolean :replace_meter

      t.timestamps
    end
     remove_column :dma_reports, :further_action_id, :uuid
     remove_column :zone_reports, :further_action_id, :uuid
     remove_column :account_reports, :further_action_id, :uuid
  end
end
