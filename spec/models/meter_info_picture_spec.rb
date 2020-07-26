# == Schema Information
#
# Table name: meter_info_pictures
#
#  id            :uuid             not null, primary key
#  meter_info_id :uuid
#  picture       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe MeterInfoPicture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
