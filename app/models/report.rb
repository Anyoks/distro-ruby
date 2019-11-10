# == Schema Information
#
# Table name: reports
#
#  id                :uuid             not null, primary key
#  completed         :boolean
#  comments          :string
#  further_action_id :uuid
#  assignment_id     :uuid
#  stage_id          :uuid
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Report < ApplicationRecord
  belongs_to :further_action
  belongs_to :assignment
  after_commit :update_assignment_stage, on: :create
  before_validation :default_f_action, on: :create

  # "Assign"
  # "Further Action"
  # "Pending"
  # "Complete"
  
  def default_f_action
    if self.further_action_id == nil 
      self.further_action_id = FurtherAction.where(name:"none").first.id
    end
  end

  def update_assignment_stage
    if (self.completed && self.further_action.name == 'none') 
      logger.debug "complete"	
      # completed
      self.assignment.update_attributes(stage_id: Stage.where(name:  "Complete").first.id )
    elsif (self.completed && self.further_action.name != 'none')
      logger.debug "F action"	
      # further action
      self.assignment.update_attributes(stage_id: Stage.where(name: "Further Action").first.id )
    elsif (self.completed == false )
      logger.debug "Pending"	
      # if complete is false and no further action
      # pending 
      # == complete == false
      id =  Stage.where(name: "Pending").first.id 
      logger.debug "Pending id is #{id}"	
      self.assignment.update_attributes(stage_id: id)
    end
  end

  def self.myreports(userId)
    # byebug
    user = User.find_by(uid: userId)
    user.reports.includes( :assignment, :further_action)
  end
  
end
