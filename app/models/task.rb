# == Schema Information
#
# Table name: tasks
#
#  id               :uuid             not null, primary key
#  name             :string
#  description      :string
#  subdepartment_id :uuid
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Task < ApplicationRecord
    belongs_to :subdepartment
    has_many :assignments



    def staffs
        self.subdepartment.staffs
    end

    def total_assignments
      self.assignments.count
    end
    
    def my_total_assignments(userId)
      
      user_id = User.find_by(uid: userId[:user_id]).id
      # byebug
      self.assignments.where(user_id: user_id).count
    end

    # get tasks for a user's subdepartment
    def self.mytasks(userId)
      # byebug
      user_id = User.find_by(uid: userId).id
      User.find(user_id).subdepartment.tasks
    end

    def total_assign_group_by_week
      # total assignments for this taks by week since ever
        data = self.assignments.group_by_week(:updated_at).count
        name = data.keys
        val  = data.values
        
        dates = []
        name.each { |a| dates << a.to_s }
        final_hash = []

        dates.each_with_index do | d, index |
          final_hash << {
            date: d,
            total: val[index]
          }
        end
        return final_hash
    end

    def total_complete_assign_group_by_week
      # total assignments for this taks this 
        stage = Stage.where(name: 'Complete')
        self.assignments.where(stage_id: stage.id ).group_by_week(:updated_at).count
    end

    def total_assign_group_by_month
      # total assignments for this taks this 
        self.assignments.group_by_month(:updated_at).count
    end

    def total_complete_assign_group_by_month
      # total assignments for this taks this 
        stage = Stage.where(name: 'Complete')
        self.assignments.where(stage_id: stage.id ).group_by_month(:updated_at).count
    end
end
