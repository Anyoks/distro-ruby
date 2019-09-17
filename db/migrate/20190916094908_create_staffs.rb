class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs, id: :uuid do |t|
      t.string :firstName
      t.string :lastName
      t.string :phoneNumber
      t.string :description
      t.references :position, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
