class AddAnotherColumnToReportFurtherAction < ActiveRecord::Migration[5.2]
  def change
    add_column :report_further_actions, :repairs_done, :string
  end
end
