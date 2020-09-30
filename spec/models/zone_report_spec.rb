# == Schema Information
#
# Table name: zone_reports
#
#  id                 :uuid             not null, primary key
#  scheme_id          :uuid
#  bulk_meter_id      :uuid
#  zone_assignment_id :uuid
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  latitude           :float
#  longitude          :float
#  accuracy           :float
#  altitude           :float
#

require 'rails_helper'

RSpec.describe ZoneReport, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
