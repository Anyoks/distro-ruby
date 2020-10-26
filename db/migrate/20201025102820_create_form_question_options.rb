class CreateFormQuestionOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :form_question_options, id: :uuid do |t|
      t.jsonb :data, null: false, default: '{}'
      t.references :form_question,  type: :uuid, foreign_key: true
      t.integer :position

      t.timestamps
    end
    add_index  :form_question_options, :data, using: :gin
  end
end
