class AddColumnToConnectionInfo < ActiveRecord::Migration[5.2]
  def change
    add_column :connection_infos, :account_report_id, :uuid, foreign_key: true
    add_column :meter_infos, :account_report_id, :uuid, foreign_key: true
    add_column :anomallies, :account_report_id, :uuid, foreign_key: true
  end
end
