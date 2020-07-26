# == Schema Information
#
# Table name: floors
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Floor < ApplicationRecord
    has_many :building_infos
end
