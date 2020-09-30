# == Schema Information
#
# Table name: reports
#
#  id                :uuid             not null, primary key
#  completed         :boolean
#  comments          :string
#  further_action_id :uuid
#  assignment_id     :uuid             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  picture           :string
#  remark_id         :uuid             default("e6f350a6-1bb1-4e7b-921b-8dfcc5a534d2"), not null
#  meter_reading     :string
#  meter_serial      :string
#

require 'rails_helper'

RSpec.describe Report, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
