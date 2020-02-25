class DmaAssignment < ApplicationRecord
  before_validation :add_default_stage, on: :create
  belongs_to :dma
  belongs_to :task
  belongs_to :user
  belongs_to :staff
  belongs_to :stage

  def date
    self.created_at.strftime("%d/%m/%Y")
  end

  def add_default_stage
    self.stage_id = Stage.find_by(name: "Assign").id
  end
end
