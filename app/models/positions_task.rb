class PositionsTask < ApplicationRecord
  belongs_to :tasks
  belongs_to :positions
end
