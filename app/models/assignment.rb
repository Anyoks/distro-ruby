# == Schema Information
#
# Table name: assignments
#
#  id         :uuid             not null, primary key
#  task_id    :uuid             not null
#  staff_id   :uuid             not null
#  stage_id   :uuid             not null
#  account_id :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Assignment < ApplicationRecord
    before_validation :add_default_stage, on: :create
    # after_commit :update_assignment_stage, on: :create

    belongs_to :stage
    belongs_to :task
    belongs_to :account
    belongs_to :staff
    has_one :report

    def add_default_stage
        self.stage_id = Stage.find_by(name: "Assign").id
    end
    
end