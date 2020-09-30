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

  def self.latest_pervious_reading
    details = AccountDetail.order("created_at").last
    if details.nil?
      ""
    else
      details.previous_reading
    end
  end

  # We get the current account status by getting the latest account detail, 
  # this one is to get the latest from a list
  def self.account_status
    details = AccountDetail.order("created_at").last
    if details.nil?
      ""
    else
      if details.account_status.nil?
        ""
      else
        details.account_status.name
      end
    end
  end

  def my_account_status
    
      if self.account_status.nil?
        ""
      else
        self.account_status.name
      end
  
  end

  # We get the current building type by getting the latest account details
  # this one is to get the latest from a list
  def self.building_type

    # byebug 

    if AccountDetail.order("created_at").last.nil?
      ""
    else
      if AccountDetail.order("created_at").last.building_type_cartegory.nil?
        ""
      else
        AccountDetail.order("created_at").last.building_type_cartegory.building_type.name
      end
    end
    
  end

  def my_building_type
     
      if self.building_type_cartegory.nil?
        ""
      else
       self.building_type_cartegory.building_type.name
      end
    
  end
end
