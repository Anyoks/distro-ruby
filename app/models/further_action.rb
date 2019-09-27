class FurtherAction < ApplicationRecord
    has_many :reports
    has_one :other
end
