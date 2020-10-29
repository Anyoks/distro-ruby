class CreateFormQuestionDatumFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :form_question_datum_files, id: :uuid do |t|
      t.string :file_type
      t.references :form_question_datum, type: :uuid, foreign_key: true
      t.string :file

      t.timestamps
    end
  end
end
