# == Schema Information
#
# Table name: illegaluses
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Illegaluse < ApplicationRecord
    # has_one :other_illegal_use
    has_many :anomallies
end
