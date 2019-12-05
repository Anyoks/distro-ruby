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

  attr_accessor :picture_data

  belongs_to :further_action
  belongs_to :assignment
  after_commit :update_assignment_stage, on: :create
  before_validation :default_f_action, on: :create
  has_many :pictures

  # mount_uploader :picture, PictureUploader # using carrier wave


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

  def complete
    self.completed.to_s
  end

  def image_url

		if Rails.env == "development" 
			root_url = "http://localhost:3000"
		else
			root_url = "https://distroapp.io"
		end

    urls = []
    full_url = ""
    if self.pictures.first.present?
      # byebug
      url = self.pictures.first.url.present? ? self.pictures.first.url : nil
      full_url =  url !=nil ? root_url + url : ""
    end
    
			# urls << root_url + pic.image.url(:medium)
		
		return full_url	
	end
  
  def date
    self.created_at.strftime("%d/%m/%Y")
  end

  def reported_by
    self.assignment.staff.full_names
  end
end
