# == Schema Information
#
# Table name: meter_stand_problems
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MeterStandProblem < ApplicationRecord
    has_many :anomallies
end
