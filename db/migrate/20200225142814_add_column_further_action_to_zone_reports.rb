class AddColumnFurtherActionToZoneReports < ActiveRecord::Migration[5.2]
  def change
    add_column :zone_reports, :further_action_id, :uuid, foreign_key: true
  end
end
