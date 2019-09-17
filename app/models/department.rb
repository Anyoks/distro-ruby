# == Schema Information
#
# Table name: departments
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Department < ApplicationRecord
    has_many :subdepartments, dependent: :destroy
end
