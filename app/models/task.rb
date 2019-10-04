# == Schema Information
#
# Table name: tasks
#
#  id               :uuid             not null, primary key
#  name             :string
#  description      :string
#  subdepartment_id :uuid
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Task < ApplicationRecord
    belongs_to :subdepartment
    has_many :assignments



    def staffs
        self.subdepartment.staffs
    end
end
