class Task < ApplicationRecord
    belongs_to :subdepartment
    has_many :assignments
end
