class Illegaluse < ApplicationRecord
    # has_one :other_illegal_use
    has_many :anomallies
end
