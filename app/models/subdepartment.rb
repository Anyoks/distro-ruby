class Subdepartment < ApplicationRecord
    belongs_to :department
    has_many :postions
    has_many :tasks
    has_many :staffs, through: :postions
end
