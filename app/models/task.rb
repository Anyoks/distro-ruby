# == Schema Information
#
# Table name: tasks
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Task < ApplicationRecord
   before_save :downcase_fields
    # belongs_to :subdepartment
    # has_and_belongs_to_many :subdepartments   # <== rmove this. change it to has_and_belongs_to_many :positions
    has_and_belongs_to_many :positions
    has_many :assignments
    has_many :dma_assignments
    has_many :zone_assignments
    has_many :staffs, through: :positions

    # task should have and belong to many positions
    # this will remove the current state where all staff in a department will be in 
    # a task just by adding a task to a ssubdpartment



    # def staffs
    #     self.subdepartment.staffs
    # end
    def self.populate_join_table
        Task.all.each do |pos|
            sub = Subdepartment.find(pos.subdepartment_id)
            sub.tasks << pos
        end
    end

    def downcase_fields
      self.name.downcase!
    end


    # def staffs
    #   staffs = []
    #   self.subdepartments.each do |sub|
    #     sub.staffs.each do |staff|
    #       staffs << staff
    #     end
    #   end

    #   return staffs
    # end

    def staff_names
      staff_names = []
      self.subdepartments.each do |sub|
        sub.staffs.each do |staff|
          staff_names << staff.full_names
        end
      end

      return staff_names
    end

    def total_assignments
      self.assignments.count
    end
    
    # account tasks
    def my_total_assignments(userId)
      
      account_assignments = self.my_total_account_assignments(userId)
      dma_assignments = self.my_total_dma_assignments(userId)
      zone_assignments = self.my_total_zone_assignments(userId)
      # user_id = User.find_by(uid: userId[:user_id]).id
      # # byebug
      # self.assignments.where(user_id: user_id).count
      total = account_assignments + dma_assignments + zone_assignments
    end

    # account tasks/assignments
    def my_total_account_assignments(userId)
      
      user_id = User.find_by(uid: userId[:user_id]).id
      # byebug
      self.assignments.where(user_id: user_id).count
    end

    # dma tasks
    def my_total_dma_assignments(userId)
      
      user_id = User.find_by(uid: userId[:user_id]).id
      # byebug
      self.dma_assignments.where(user_id: user_id).count
    end

    # zone tasks
     def my_total_zone_assignments(userId)
      
      user_id = User.find_by(uid: userId[:user_id]).id
      # byebug
      self.zone_assignments.where(user_id: user_id).count
    end


    def self.tasks_for_graph
      Task.all.reject{|k| k.total_assignments == 0 }
    end

    def self.my_tasks_for_graph(userId)
      self.mytasks(userId).reject{|k| k.total_assignments == 0 }
    end

    # get tasks for a user's subdepartment
    def self.mytasks(userId)
      # byebug
      user_id = User.find_by(uid: userId)
      # User.find(user_id).subdepartment.tasks
      user_id.subdepartment.tasks.distinct
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
        stage = Stage.where(name: 'complete')
        self.assignments.where(stage_id: stage.id ).group_by_week(:updated_at).count
    end

    def total_assign_group_by_month
      # total assignments for this taks this 
        self.assignments.group_by_month(:updated_at).count
    end

    def total_complete_assign_group_by_month
      # total assignments for this taks this 
        stage = Stage.where(name: 'complete')
        self.assignments.where(stage_id: stage.id ).group_by_month(:updated_at).count
    end
end
