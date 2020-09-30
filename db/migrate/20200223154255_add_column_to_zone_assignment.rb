class AddColumnToZoneAssignment < ActiveRecord::Migration[5.2]
  def change
    add_column :zone_assignments, :desc, :string
  end
end
