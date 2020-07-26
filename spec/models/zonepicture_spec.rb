# == Schema Information
#
# Table name: zonepictures
#
#  id             :uuid             not null, primary key
#  zone_report_id :uuid
#  picture        :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Zonepicture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
