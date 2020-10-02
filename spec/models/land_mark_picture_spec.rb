# == Schema Information
#
# Table name: land_mark_pictures
#
#  id                   :uuid             not null, primary key
#  burst_and_lealage_id :uuid
#  picture              :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe LandMarkPicture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
