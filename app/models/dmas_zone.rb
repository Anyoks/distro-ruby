# == Schema Information
#
# Table name: dmas_zones
#
#  zone_id    :uuid
#  dma_id     :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DmasZone < ApplicationRecord
  belongs_to :zones
  belongs_to :damas
end
