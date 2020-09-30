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

require 'rails_helper'

RSpec.describe OtherIllegalUse, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
