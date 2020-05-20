class CreateFloors < ActiveRecord::Migration[5.2]
  def change
    create_table :floors, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end