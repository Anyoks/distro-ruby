# == Schema Information
#
# Table name: burst_and_lealages
#
#  id               :uuid             not null, primary key
#  zone_report_id   :uuid
#  dma_report_id    :uuid
#  pipematerial_id  :uuid
#  pipesize_id      :uuid
#  surrounding_area :string
#  remarks          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe BurstAndLealage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
