# == Schema Information
#
# Table name: walkroutes
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :string
#  subzone_id  :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Walkroute < ApplicationRecord
    belongs_to :subzone
end
