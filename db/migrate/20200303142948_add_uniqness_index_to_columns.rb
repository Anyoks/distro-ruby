class AddUniqnessIndexToColumns < ActiveRecord::Migration[5.2]
  def change
    add_index :anomallies, ['dma_report_id', 'zone_report_id', 'account_report_id'], unique: true, :name => 'anomallies_uniq_index'   
    add_index :connection_infos, ['dma_report_id', 'zone_report_id', 'account_report_id'], unique: true, :name => 'connection_infos_uniq_index'
    add_index :meter_infos, ['dma_report_id', 'zone_report_id', 'account_report_id'], unique: true, :name => 'meter_infos_uniq_index'
    add_index :burst_and_lealages, ['dma_report_id', 'zone_report_id'], unique: true, :name => 'burst_and_lealage_uniq_index'

  end
end
