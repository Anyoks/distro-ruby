# == Schema Information
#
# Table name: positions_tasks
#
#  task_id     :uuid
#  position_id :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PositionsTask < ApplicationRecord
  belongs_to :tasks
  belongs_to :positions
end
