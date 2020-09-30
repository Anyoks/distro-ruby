class CreateReportFurtherActionPictures < ActiveRecord::Migration[5.2]
  def change
    create_table :report_further_action_pictures, id: :uuid do |t|
      t.uuid :report_further_action_id, type: :uuid 
      t.string :picture

      t.timestamps
    end
    add_index :report_further_action_pictures, 'report_further_action_id', :name => 'report_faction_pictures'   
  end
end
