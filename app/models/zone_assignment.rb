class ZoneAssignment < ApplicationRecord
   before_validation :add_default_stage, on: :create
  belongs_to :zone
  belongs_to :task
  belongs_to :user
  belongs_to :staff
  belongs_to :stage
  has_one :zone_report

  def date
        self.created_at.strftime("%d/%m/%Y")
  end

  def add_default_stage
      self.stage_id = Stage.find_by(name: "assign").id
  end
    def self.undone_assingments
        ZoneAssignment.where("id NOT IN (SELECT  zone_assignment_id FROM Zone_Reports)")
    end

    def self.myassignments(userId)
      # byebug
      user = User.find_by(uid: userId)
      user.zone_assignments.includes(:task, :staff, :stage, :zone, :zone_report)
    end
end
