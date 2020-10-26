class CreateFormQuestionData < ActiveRecord::Migration[5.2]
  def change
    create_table :form_question_data, id: :uuid do |t|
      t.jsonb :data, null: false, default: '{}'
      t.references :form_question,  type: :uuid, foreign_key: true
      t.integer :position

      t.timestamps
    end
    add_index  :form_question_data, :data, using: :gin
  end
end
