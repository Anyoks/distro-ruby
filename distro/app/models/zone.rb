class Zone < ApplicationRecord
    has_many :subzones
    has_many :schZoneDetails
    has_many :schemes, through: :schZoneDetails
end
