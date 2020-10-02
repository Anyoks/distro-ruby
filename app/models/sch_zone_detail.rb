# == Schema Information
#
# Table name: sch_zone_details
#
#  id         :uuid             not null, primary key
#  scheme_id  :uuid
#  zone_id    :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SchZoneDetail < ApplicationRecord
    belongs_to :scheme
	belongs_to :zone

	# validates_uniqueness_of :scheme_id, :scope => :establishment_id # ensure a book doesn't have double establishments
end
