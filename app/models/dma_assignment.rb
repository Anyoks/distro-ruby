class DmaAssignment < ApplicationRecord
  before_validation :add_default_stage, on: :create
  belongs_to :dma
  belongs_to :task
  belongs_to :user
  belongs_to :staff
  belongs_to :stage
  has_one :dma_report

  def date
    self.created_at.strftime("%d/%m/%Y")
  end

  def add_default_stage
    self.stage_id = Stage.find_by(name: "Assign").id
  end
    def self.undone_assingments
        DmaAssignment.where("id NOT IN (SELECT  dma_assignment_id FROM Dma_Reports)")
    end

    def self.myassignments(userId)
      # byebug
      user = User.find_by(uid: userId)
      user.dma_assignments.includes(:task, :staff, :stage, :dma, :dma_report)
    end
end
