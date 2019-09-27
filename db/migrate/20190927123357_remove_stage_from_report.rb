class RemoveStageFromReport < ActiveRecord::Migration[5.2]
  def change
    remove_column :reports, :stage_id, :UUID
  end
end
