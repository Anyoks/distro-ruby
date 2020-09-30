# == Schema Information
#
# Table name: bulk_meters
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BulkMeter < ApplicationRecord
    has_many :zone_reports
    has_many :dma_reports
end
