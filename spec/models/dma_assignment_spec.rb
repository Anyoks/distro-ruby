# == Schema Information
#
# Table name: dma_assignments
#
#  id         :uuid             not null, primary key
#  dma_id     :uuid
#  task_id    :uuid
#  user_id    :uuid
#  staff_id   :uuid
#  stage_id   :uuid
#  desc       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe DmaAssignment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
