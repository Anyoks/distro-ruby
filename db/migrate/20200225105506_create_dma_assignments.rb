class CreateDmaAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :dma_assignments, id: :uuid do |t|
      t.references :dma,  type: :uuid,  foreign_key: true
      t.references :task, type: :uuid,  foreign_key: true
      t.references :user, type: :uuid,  foreign_key: true
      t.references :staff,type: :uuid,   foreign_key: true
      t.references :stage,type: :uuid,   foreign_key: true
      t.string :desc

      t.timestamps  
    end
  end
end
