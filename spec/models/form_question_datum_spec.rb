# == Schema Information
#
# Table name: form_question_data
#
#  id               :uuid             not null, primary key
#  data             :jsonb            not null
#  form_question_id :uuid
#  position         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe FormQuestionDatum, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
