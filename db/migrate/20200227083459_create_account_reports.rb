class CreateAccountReports < ActiveRecord::Migration[5.2]
  def change
    create_table :account_reports, id: :uuid do |t|
      t.references :assignment, type: :uuid, foreign_key: true
      t.references :further_action, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
