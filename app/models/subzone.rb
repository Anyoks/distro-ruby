# == Schema Information
#
# Table name: subzones
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :string
#  zone_id     :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Subzone < ApplicationRecord
    belongs_to :zone
    has_many :walkroutes

     has_many :accounts, through: :walkroutes
end
