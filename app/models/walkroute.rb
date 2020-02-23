# == Schema Information
#
# Table name: walkroutes
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :string
#  subzone_id  :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Walkroute < ApplicationRecord
     before_save :downcase_fields
    belongs_to :subzone
    has_many :accounts

    def downcase_fields
      self.name.downcase!
    end
end
