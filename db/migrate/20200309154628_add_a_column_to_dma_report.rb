class AddAColumnToDmaReport < ActiveRecord::Migration[5.2]
  def change
    add_column :dma_reports, :section, :string
  end
end
