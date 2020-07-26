# == Schema Information
#
# Table name: meter_statuses
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MeterStatus < ApplicationRecord
    has_many :meter_infos
end
