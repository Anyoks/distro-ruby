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
     before_save :downcase_fields

    def downcase_fields
      self.name.downcase!
    end
end
