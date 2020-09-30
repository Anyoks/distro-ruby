# == Schema Information
#
# Table name: anomallies
#
#  id                     :uuid             not null, primary key
#  zone_report_id         :uuid
#  dma_report_id          :uuid
#  meter_stand_problem_id :uuid
#  illegaluse_id          :uuid
#  labelled               :boolean
#  other_problem          :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  account_report_id      :uuid
#  other_illegal_use      :string
#

require 'rails_helper'

RSpec.describe Anomally, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
