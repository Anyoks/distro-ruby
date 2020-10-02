# == Schema Information
#
# Table name: meter_infos
#
#  id                   :uuid             not null, primary key
#  zone_report_id       :uuid
#  dma_report_id        :uuid
#  meter_status_id      :uuid
#  meter_serial         :string
#  meter_reading        :string
#  meter_accessible     :boolean
#  meter_present        :string
#  meter_stand_location :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  account_report_id    :uuid
#

require 'rails_helper'

RSpec.describe MeterInfo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
