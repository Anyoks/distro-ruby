class CreateOtherIllegalUses < ActiveRecord::Migration[5.2]
  def change
    create_table :other_illegal_uses, id: :uuid do |t|
      t.string :name
      t.references :illegaluse, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
