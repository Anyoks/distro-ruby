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

class Form < ApplicationRecord
  belongs_to :task
  has_many :form_questions, -> {order(position: :asc)} ,dependent: :destroy
end
