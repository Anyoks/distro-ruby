# == Schema Information
#
# Table name: remarks
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Remark < ApplicationRecord
  has_many :reports
  has_one :other_remark
end
