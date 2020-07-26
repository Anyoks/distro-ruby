# == Schema Information
#
# Table name: dmapictures
#
#  id            :uuid             not null, primary key
#  dma_report_id :uuid
#  picture       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Dmapicture, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
