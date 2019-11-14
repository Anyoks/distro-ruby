class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tasks, :subdepartments, id: false do |t|
      # t.index [:task_id, :subdepartment_id]
      # t.index [:subdepartment_id, :task_id]
      t.uuid :task_id, index: true
  	  t.uuid :subdepartment_id, index: true
    end
  end
end