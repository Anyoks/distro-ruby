class RemoveFinishTimeFromAssignment < ActiveRecord::Migration[5.2]
  def change
    remove_column :assignments, :finishTime, :DateTime
  end
end
