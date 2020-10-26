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

class FormQuestion < ApplicationRecord
  belongs_to :form
  has_one :form_question_datum, dependent: :destroy
  before_save :default_position

  def default_position
    if self.position == nil
       max_position = self.form.form_questions.maximum(:position)
      if max_position == nil
        self.position = 1
      else
        self.position = max_position + 1
      end
        self.save!
    end
   
  end
end
