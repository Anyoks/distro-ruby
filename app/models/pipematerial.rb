# == Schema Information
#
# Table name: pipematerials
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pipematerial < ApplicationRecord
    has_many :burst_and_lealages
end
