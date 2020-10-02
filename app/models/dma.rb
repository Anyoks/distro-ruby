# == Schema Information
#
# Table name: dmas
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Dma < ApplicationRecord
     has_and_belongs_to_many :zones
end
