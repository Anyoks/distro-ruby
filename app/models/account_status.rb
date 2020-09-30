# == Schema Information
#
# Table name: account_statuses
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AccountStatus < ApplicationRecord
    has_many :account_details
end
