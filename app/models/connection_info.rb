# == Schema Information
#
# Table name: connection_infos
#
#  id                         :uuid             not null, primary key
#  zone_report_id             :uuid
#  dma_report_id              :uuid
#  building_type_cartegory_id :uuid
#  labelled                   :boolean
#  connection_number          :string
#  account_status_id          :uuid
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  account_report_id          :uuid
#  name                       :string
#

class ConnectionInfo < ApplicationRecord
  belongs_to :zone_report, optional: true
  belongs_to :dma_report, optional: true
  belongs_to :account_report, optional: true
  belongs_to :building_type_cartegory
  has_one :building_info, dependent: :destroy
  belongs_to :account_status
  validates_uniqueness_of :dma_report_id, scope: [:zone_report_id, :account_report_id]
end
