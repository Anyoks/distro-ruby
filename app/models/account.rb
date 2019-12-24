# == Schema Information
#
# Table name: accounts
#
#  id                 :uuid             not null, primary key
#  number             :string
#  meter_serial       :string
#  name               :string
#  walkroute_id       :uuid
#  address            :string
#  latitude           :float
#  longitude          :float
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  old_account_number :string
#  sewer              :string
#  water              :string
#  connection_status  :string
#  tariff             :string
#  building_type      :string
#  house_type         :string
#  house_units        :string
#

class Account < ApplicationRecord
    belongs_to :walkroute
    has_many :assignments
    has_many :account_details


    def zone
        self.walkroute.subzone.zone
    end
end
