# == Schema Information
#
# Table name: accounts
#
#  id           :uuid             not null, primary key
#  number       :string
#  meter_serial :string
#  name         :string
#  walkroute_id :uuid
#  address      :string
#  latitude     :float
#  longitude    :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Account < ApplicationRecord
    belongs_to :walkroute
    has_many :assignments


    def zone
        self.walkroute.subzone.zone
    end
end
