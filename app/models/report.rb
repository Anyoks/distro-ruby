class Report < ApplicationRecord
  belongs_to :further_action
  belongs_to :assignment
  belongs_to :stage
end
