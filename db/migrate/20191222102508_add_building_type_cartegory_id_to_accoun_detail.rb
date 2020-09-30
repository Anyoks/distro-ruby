class AddBuildingTypeCartegoryIdToAccounDetail < ActiveRecord::Migration[5.2]
  def change
    add_reference :account_details, :building_type_cartegory, type: :uuid,  foreign_key: true
    remove_column :account_details, :building_type_id, type: :uuid
  end
end
