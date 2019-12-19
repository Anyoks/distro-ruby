class Remark < ApplicationRecord
  has_many :reports
  has_one :other_remark
end
