# == Schema Information
#
# Table name: positions
#
#  id               :uuid             not null, primary key
#  name             :string
#  description      :string
#  subdepartment_id :uuid
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Position < ApplicationRecord
    belongs_to :subdepartment
    has_many :staffs
end
