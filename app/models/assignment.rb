# == Schema Information
#
# Table name: assignments
#
#  id         :uuid             not null, primary key
#  task_id    :uuid             not null
#  staff_id   :uuid             not null
#  stage_id   :uuid             not null
#  account_id :uuid             not null
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  finishTime :datetime         not null
#

class Assignment < ApplicationRecord
    belongs_to :stage
    belongs_to :task
    belongs_to :account
    belongs_to :staff
end
