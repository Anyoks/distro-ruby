# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ApplicationRecord
    has_many :users
     before_save :downcase_fields

     
    def downcase_fields
      self.name.downcase!
    end
end
