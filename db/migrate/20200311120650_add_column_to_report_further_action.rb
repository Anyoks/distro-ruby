class AddColumnToReportFurtherAction < ActiveRecord::Migration[5.2]
  def change
    add_column :report_further_actions, :disconnection_type, :string
  end
end
