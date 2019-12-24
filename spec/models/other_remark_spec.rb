# == Schema Information
#
# Table name: other_remarks
#
#  id         :uuid             not null, primary key
#  name       :string
#  remark_id  :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe OtherRemark, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
