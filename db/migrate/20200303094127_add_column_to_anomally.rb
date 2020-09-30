class AddColumnToAnomally < ActiveRecord::Migration[5.2]
  def change
    add_column :anomallies, :other_illegal_use, :string
  end
end
