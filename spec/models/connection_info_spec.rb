# == Schema Information
#
# Table name: connection_infos
#
#  id                         :uuid             not null, primary key
#  zone_report_id             :uuid
#  dma_report_id              :uuid
#  building_type_cartegory_id :uuid
#  labelled                   :boolean
#  connection_number          :string
#  account_status_id          :uuid
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  account_report_id          :uuid
#  name                       :string
#

require 'rails_helper'

RSpec.describe ConnectionInfo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
