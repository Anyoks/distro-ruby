# == Schema Information
#
# Table name: account_reports
#
#  id            :uuid             not null, primary key
#  assignment_id :uuid
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  latitude      :float
#  longitude     :float
#  accuracy      :float
#  altitude      :float
#

require 'rails_helper'

RSpec.describe AccountReport, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
