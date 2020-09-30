class RenameColumnBuildingInfo < ActiveRecord::Migration[5.2]
  def change
    rename_column :building_infos, :floors_id, :floor_id
  end
end
