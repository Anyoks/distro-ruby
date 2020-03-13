class RemoveColumnFromConnectionInfo < ActiveRecord::Migration[5.2]
  def change
    remove_column :zone_reports, :zone_id, :uuid
    remove_column :dma_reports, :dma_id, :uuid
    # remove_column :account_reports, :account_id, :uuid
  end
end
