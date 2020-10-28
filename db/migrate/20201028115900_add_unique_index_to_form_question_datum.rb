class AddUniqueIndexToFormQuestionDatum < ActiveRecord::Migration[5.2]
  def change
    add_index :form_question_data, :form_question_id, unique: true, :name => 'my_unique_index'
  end
end
