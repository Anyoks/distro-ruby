# == Schema Information
#
# Table name: other_remarks
#
#  id         :uuid             not null, primary key
#  name       :string
#  remark_id  :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class OtherRemark < ApplicationRecord
  belongs_to :remark
end
