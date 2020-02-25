class BulkMeter < ApplicationRecord
    has_many :zone_reports
    has_many :dma_reports
end
