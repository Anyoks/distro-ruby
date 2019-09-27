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

  "Assign"
  "Further Action"
  "Pending"
  "Complete"
  
  def update_assignment_stage
    if (self.completed && self.further_action == 'none') 
      logger.debug "complete"	
      # completed
      self.assignment.update_attributes(stage_id: Stage.where(name:  "Complete").first.id )
    elsif (completed && self.further_action != 'none')
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
  
end
