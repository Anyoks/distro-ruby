class BuildingInfo < ApplicationRecord
  belongs_to :floor
  belongs_to :connection_info
end
