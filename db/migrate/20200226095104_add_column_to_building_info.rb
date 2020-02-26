class AddColumnToBuildingInfo < ActiveRecord::Migration[5.2]
  def change
    add_reference :building_infos, :connection_info,  type: :uuid, foreign_key: true
    remove_column :connection_infos, :building_info_id, :uuid
  end
end
