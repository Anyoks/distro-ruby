# == Schema Information
#
# Table name: pictures
#
#  id         :uuid             not null, primary key
#  report_id  :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  picture    :string
#

require 'rails_helper'

RSpec.describe Picture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
