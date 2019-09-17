# == Schema Information
#
# Table name: zones
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Zone < ApplicationRecord
    has_many :subzones
    has_many :schZoneDetails
    has_many :schemes, through: :schZoneDetails
end
