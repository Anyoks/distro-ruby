# == Schema Information
#
# Table name: positions
#
#  id               :uuid             not null, primary key
#  name             :string
#  description      :string
#  subdepartment_id :uuid
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Position < ApplicationRecord
    has_and_belongs_to_many :subdepartments
    has_many :staffs
    has_and_belongs_to_many :tasks




    
    # def Self.populate_join_table
    #     Position.all.each do |pos|
    #         sub = Subdepartment.find(pos.subdepartment_id)
    #         sub.positions << pos
    #     end
    # end
end
