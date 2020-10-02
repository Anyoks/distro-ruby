class CreateOtherRemarks < ActiveRecord::Migration[5.2]
  def change
    create_table :other_remarks, id: :uuid do |t|
      t.string :name
      t.references :remark, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
