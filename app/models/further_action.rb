# == Schema Information
#
# Table name: further_actions
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class FurtherAction < ApplicationRecord
    has_many :reports
    has_one :other
end
