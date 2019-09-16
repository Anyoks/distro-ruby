class Position < ApplicationRecord
    belongs_to :subdepartment
    has_many :staffs
end
