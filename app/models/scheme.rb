class Scheme < ApplicationRecord
    has_many :schZoneDetails, dependent: :destroy
    has_many :zones, through: :schZoneDetails
end
