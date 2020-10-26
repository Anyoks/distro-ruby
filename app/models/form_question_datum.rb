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

class FormQuestionDatum < ApplicationRecord
  belongs_to :form_question
end
