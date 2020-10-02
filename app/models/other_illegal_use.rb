# == Schema Information
#
# Table name: other_illegal_uses
#
#  id            :uuid             not null, primary key
#  name          :string
#  illegaluse_id :uuid
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class OtherIllegalUse < ApplicationRecord
  belongs_to :illegaluse
end
