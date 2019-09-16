class Department < ApplicationRecord
    has_many :subdepartments, dependent: :destroy
end
