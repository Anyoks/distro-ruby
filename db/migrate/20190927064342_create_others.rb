class CreateOthers < ActiveRecord::Migration[5.2]
  def change
    create_table :others, id: :uuid do |t|
      t.string :name
      t.references :further_action, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
