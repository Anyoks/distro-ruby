class AddColumnToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :dma_reports, :latitude, :float
    add_column :dma_reports, :longitude, :float
    add_column :dma_reports, :accuracy, :float
    add_column :dma_reports, :altitude, :float

    add_column :zone_reports, :latitude, :float
    add_column :zone_reports, :longitude, :float
    add_column :zone_reports, :accuracy, :float
    add_column :zone_reports, :altitude, :float
    

    add_column :account_reports, :latitude, :float
    add_column :account_reports, :longitude, :float
    add_column :account_reports, :accuracy, :float
    add_column :account_reports, :altitude, :float
    
  end
end
