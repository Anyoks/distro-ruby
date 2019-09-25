# == Schema Information
#
# Table name: staffs
#
#  id          :uuid             not null, primary key
#  firstName   :string
#  lastName    :string
#  phoneNumber :string
#  description :string
#  position_id :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Staff < ApplicationRecord
    belongs_to :position
    has_many :assignments
end
