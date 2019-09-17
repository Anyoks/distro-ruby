# == Schema Information
#
# Table name: walkroutes
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :string
#  subzone_id  :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Walkroute, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
