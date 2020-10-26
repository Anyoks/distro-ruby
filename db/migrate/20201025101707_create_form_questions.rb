class CreateFormQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :form_questions, id: :uuid do |t|
      t.text :query
      t.string :response_type
      t.references :form,  type: :uuid, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
