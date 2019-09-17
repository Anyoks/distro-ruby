# == Schema Information
#
# Table name: schemes
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Scheme < ApplicationRecord
    has_many :schZoneDetails, dependent: :destroy
    has_many :zones, through: :schZoneDetails
end
