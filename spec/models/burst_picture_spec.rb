# == Schema Information
#
# Table name: burst_pictures
#
#  id                   :uuid             not null, primary key
#  burst_and_lealage_id :uuid
#  picture              :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe BurstPicture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
