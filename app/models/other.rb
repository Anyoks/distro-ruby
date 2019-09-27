# == Schema Information
#
# Table name: others
#
#  id                :uuid             not null, primary key
#  name              :string
#  further_action_id :uuid
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Other < ApplicationRecord
  belongs_to :further_action
end
