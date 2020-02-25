class BuildingInfo < ApplicationRecord
  belongs_to :floors
  has_many :connection_infos
end
