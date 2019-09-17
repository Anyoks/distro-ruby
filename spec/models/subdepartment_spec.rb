# == Schema Information
#
# Table name: subdepartments
#
#  id            :uuid             not null, primary key
#  name          :string
#  description   :string
#  department_id :uuid
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Subdepartment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
