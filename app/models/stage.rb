# frozen_string_literal: true

# == Schema Information
#
# Table name: stages
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Stage < ApplicationRecord
  has_many :assignments # , dependent: :destroy

  def total_assignments
    self.assignments.count
 end
end
