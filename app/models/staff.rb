# == Schema Information
#
# Table name: staffs
#
#  id           :uuid             not null, primary key
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  description  :string
#  position_id  :uuid
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Staff < ApplicationRecord
    belongs_to :position
    has_many :assignments
end
