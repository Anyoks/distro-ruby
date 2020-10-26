# == Schema Information
#
# Table name: form_questions
#
#  id            :uuid             not null, primary key
#  query         :text
#  response_type :string
#  form_id       :uuid
#  position      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  options       :jsonb            not null
#

require 'rails_helper'

RSpec.describe FormQuestion, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
