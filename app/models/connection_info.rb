class ConnectionInfo < ApplicationRecord
  belongs_to :zone_report, optional: true
  belongs_to :dma_report, optional: true
  belongs_to :building_type_cartegory
  belongs_to :building_info
  belongs_to :account_status
end
