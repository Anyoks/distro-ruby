class AddFinishTimeToAssignment < ActiveRecord::Migration[5.2]
  def change
    add_column :assignments, :finishTime, :datetime, null: false
  end
end
