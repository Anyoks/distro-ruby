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

require 'rails_helper'

RSpec.describe Staff, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
