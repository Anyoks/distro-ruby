# == Schema Information
#
# Table name: others
#
#  id                :uuid             not null, primary key
#  name              :string
#  further_action_id :uuid
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Other, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
