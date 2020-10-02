class CreateAccountDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :account_details, id: :uuid do |t|
      t.string :name
      t.string :current_reading
      t.string :previous_reading
      t.references :account, type: :uuid, foreign_key: true
      t.references :account_status, type: :uuid, foreign_key: true
      t.references :building_type, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
