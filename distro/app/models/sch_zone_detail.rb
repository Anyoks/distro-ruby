class SchZoneDetail < ApplicationRecord
    belongs_to :scheme
	belongs_to :zone

	# validates_uniqueness_of :scheme_id, :scope => :establishment_id # ensure a book doesn't have double establishments
end
