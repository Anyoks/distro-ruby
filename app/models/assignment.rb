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

class Assignment < ApplicationRecord
    before_validation :add_default_stage, on: :create
    # after_commit :update_assignment_stage, on: :create

    belongs_to :stage
    belongs_to :task
    belongs_to :account
    belongs_to :staff
    belongs_to :user
    has_one :report , dependent: :destroy

    def add_default_stage
        self.stage_id = Stage.find_by(name: "Assign").id
    end

    def self.undone_assingments
        Assignment.where("id NOT IN (SELECT  assignment_id FROM Reports)")
    end

    def self.myassignments(userId)
      # byebug
      user = User.find_by(uid: userId)
      user.assignments.includes(:task, :staff, :stage, :account, :report)
    end

    def date
        self.created_at.strftime("%d/%m/%Y")
    end
    
end

# Assignment.where(updated_at: Date.today-30..Date.today).group_by_week(:updated_at).count
# Assignment.where(stage_id: Stage.where(name: 'Complete').first.id).group_by_week(:updated_at).count
# Assignment.group_by_day(:updated_at).count
