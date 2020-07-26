# == Schema Information
#
# Table name: illegal_use_pictures
#
#  id          :uuid             not null, primary key
#  anomally_id :uuid
#  picture     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe IllegalUsePicture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
