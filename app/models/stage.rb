class Stage < ApplicationRecord
    has_many :assignments #, dependent: :destroy
end
