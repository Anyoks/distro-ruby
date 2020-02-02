# == Schema Information
#
# Table name: zones
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Zone < ApplicationRecord
    has_many :subzones
    has_many :schZoneDetails
    has_many :schemes, through: :schZoneDetails


    def accounts

        accounts = []
        self.subzones.includes(:walkroutes).each do | subzone|
             subzone.accounts.each do |acc|
                accounts << acc
             end
        end

        return accounts
    end

    def self.total_account_by_zone
        details = []
        Zone.all.each do |zone|
            total = zone.accounts.count
            name = zone.name
            details << "#{name} has #{total}"
        end

        return details
    end
end
