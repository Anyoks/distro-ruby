# == Schema Information
#
# Table name: forms
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :string
#  task_id     :uuid
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Form, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
