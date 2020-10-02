# == Schema Information
#
# Table name: building_infos
#
#  id                 :uuid             not null, primary key
#  single_rooms       :integer
#  bedsitters         :integer
#  one_bedrooms       :integer
#  two_bedrooms       :integer
#  three_bedrooms     :integer
#  floor_id           :uuid
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  connection_info_id :uuid
#

class BuildingInfo < ApplicationRecord
  belongs_to :floor
  belongs_to :connection_info
end
