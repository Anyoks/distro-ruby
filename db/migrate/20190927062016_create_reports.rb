class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports, id: :uuid do |t|
      t.boolean :completed
      t.string :comments
      t.references :further_action, type: :uuid, foreign_key: true
      t.references :assignment, type: :uuid,foreign_key: true
      t.references :stage, type: :uuid,foreign_key: true

      t.timestamps
    end
  end
end
