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

  def my_total_assignments(userId)
    # byebug
    user_id = User.find_by(uid: userId[:user_id]).id
    self.assignments.where(user_id).count
  end

  def myassignments(userId)
    user_id = User.find_by(uid: userId[:user_id]).id
    self.assignments.where(user_id)
  end

  def self.allOfMine(userId)
    Stage.all
  end
end
