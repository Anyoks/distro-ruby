# == Schema Information
#
# Table name: assignments
#
#  id         :uuid             not null, primary key
#  task_id    :uuid             not null
#  stage_id   :uuid             not null
#  account_id :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  staff_id   :uuid             not null
#  user_id    :uuid             default("06471470-813f-40d6-8896-5acccd13f841"), not null
#

require 'rails_helper'

RSpec.describe Assignment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
