# == Schema Information
#
# Table name: zone_assignments
#
#  id         :uuid             not null, primary key
#  zone_id    :uuid
#  task_id    :uuid
#  user_id    :uuid
#  staff_id   :uuid
#  stage_id   :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  desc       :string
#

require 'rails_helper'

RSpec.describe ZoneAssignment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
