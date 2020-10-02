class CreateBulkMeters < ActiveRecord::Migration[5.2]
  def change
    create_table :bulk_meters, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
