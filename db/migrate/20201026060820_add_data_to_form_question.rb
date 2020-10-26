class AddDataToFormQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :form_questions, :options, :jsonb,  null: false, default: '{}'
  end
end
