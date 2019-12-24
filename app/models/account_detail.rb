# == Schema Information
#
# Table name: account_details
#
#  id                         :uuid             not null, primary key
#  name                       :string
#  current_reading            :string
#  previous_reading           :string
#  account_id                 :uuid
#  account_status_id          :uuid
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  meter_serial               :string
#  building_type_cartegory_id :uuid
#

class AccountDetail < ApplicationRecord
  belongs_to :account
  belongs_to :account_status
  belongs_to :building_type_cartegory
  before_validation :add_previous_reading, on: :create

  def add_previous_reading
    latestRecord = self.account.account_details.order("created_at").last

    # return latestRecord.current_reading unless latestRecord.nil?

    if latestRecord
      self.previous_reading =  latestRecord.current_reading 
    end
    
  end
end
