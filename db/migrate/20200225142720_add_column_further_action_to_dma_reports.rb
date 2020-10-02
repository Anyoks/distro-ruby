class AddColumnFurtherActionToDmaReports < ActiveRecord::Migration[5.2]
  def change
    add_column :dma_reports, :further_action_id, :uuid, foreign_key: true
  end
end
