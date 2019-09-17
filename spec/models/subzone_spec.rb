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

require 'rails_helper'

RSpec.describe Subzone, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
