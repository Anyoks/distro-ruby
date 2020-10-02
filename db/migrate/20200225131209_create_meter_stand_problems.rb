class CreateMeterStandProblems < ActiveRecord::Migration[5.2]
  def change
    create_table :meter_stand_problems, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
