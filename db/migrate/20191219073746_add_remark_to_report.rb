class AddRemarkToReport < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :remark_id, :uuid, null: false,  :default => Remark.find_or_create_by(name: "by pass").id
    add_index :reports, :remark_id
  end
end
