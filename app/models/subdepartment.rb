# == Schema Information
#
# Table name: subdepartments
#
#  id            :uuid             not null, primary key
#  name          :string
#  description   :string
#  department_id :uuid
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Subdepartment < ApplicationRecord
    belongs_to :department
    # has_many :positions
    has_and_belongs_to_many :positions, dependent: :destroy
    has_many :users
    has_many :tasks, through: :positions
    # has_and_belongs_to_many :tasks
    has_many :staffs, through: :positions, dependent: :destroy
end
