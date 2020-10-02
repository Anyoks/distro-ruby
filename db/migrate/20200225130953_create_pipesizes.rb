class CreatePipesizes < ActiveRecord::Migration[5.2]
  def change
    create_table :pipesizes, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
