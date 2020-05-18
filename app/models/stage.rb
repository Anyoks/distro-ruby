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
  has_many :zone_assignments
  has_many :dma_assignments

   before_save :downcase_fields

  def total_assignments
    total_acc_ass = self.assignments.count
    total_zone_ass = self.zone_assignments.count
    total_dma_ass = self.dma_assignments.count
    total_assignments = total_acc_ass + total_dma_ass + total_zone_ass
    return total_assignments
  end

  def total_acc_assignments
    self.assignments.count
  end

  def total_dma_assignments
    self.dma_assignments.count
  end

  def total_zone_assignments
    self.zone_assignments.count
  end
  def downcase_fields
      self.name.downcase!
    end

  def my_total_assignments(userId)
    # byebug
    user_id = User.find_by(uid: userId[:user_id]).id
    # user = User.find_by(uid: userId[:user_id])
    total_acc_ass = self.assignments.where(user_id: user_id).count
    total_zone_ass = self.zone_assignments.where(user_id: user_id).count
    total_dma_ass = self.dma_assignments.where(user_id: user_id).count
    total_assignments = total_acc_ass + total_dma_ass + total_zone_ass
    return total_assignments
  end

   def self.my_total_assignments(userId)
    # byebug
    user_id = User.find_by(uid: userId[:user_id]).id
    # user = User.find_by(uid: userId[:user_id])
    total_assignments_here = []
    Stage.all.each do | stage|
      total_acc_ass =  stage.assignments.where(user_id: user_id).count
      total_zone_ass = stage.zone_assignments.where(user_id: user_id).count
      total_dma_ass =  stage.dma_assignments.where(user_id: user_id).count
      total_assignments_here << total_acc_ass + total_dma_ass + total_zone_ass
    end
   
    return total_assignments_here
  end

  def myassignments(userId)
    user_id = User.find_by(uid: userId[:user_id]).id
    self.assignments.where(user_id: user_id)
  end

  def my_dma_assignments(userId)
    user_id = User.find_by(uid: userId[:user_id]).id
    self.dma_assignments.where(user_id: user_id)
  end

  def my_zone_assignments(userId)
    user_id = User.find_by(uid: userId[:user_id]).id
    self.zone_assignments.where(user_id: user_id)
  end

  def self.allOfMine(userId)
    Stage.all
  end
end
