class AddColumnToReportFurterAction < ActiveRecord::Migration[5.2]
  def change
    add_column :report_further_actions, :remark, :string
    add_column :report_further_actions, :action_taken, :boolean
    add_column :report_further_actions, :other, :string
  end
end
