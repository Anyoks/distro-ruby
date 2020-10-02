class CreatePositionsTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :positions_tasks, :id => false do |t|
      t.uuid :task_id, type: :uuid, foreign_key: true
      t.uuid :position_id, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
