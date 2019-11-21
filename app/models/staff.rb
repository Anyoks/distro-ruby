# == Schema Information
#
# Table name: staffs
#
#  id           :uuid             not null, primary key
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  description  :string
#  position_id  :uuid
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Staff < ApplicationRecord
    include GraphQL::Interface
    include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, 
         :validatable,
         :omniauthable,
         :token_authenticatable

    belongs_to :position
    has_many :assignments
    has_many :reports, through: :assignments
    before_create :set_uid, :skip_confirmation

    def set_uid
       self.uid = self.email
  end

  def skip_confirmation
    self.skip_confirmation!
  end

  def undone_assignments
    self.assignments.where("id NOT IN (SELECT  assignment_id FROM Reports)")
  end

  def done_assignments
    self.assignments.where("id IN (SELECT  assignment_id FROM Reports)")
  end

  def total_assignments
    self.assignments.count
  end
  def total_un_done_assignments
    self.undone_assignments.count
  end

  def full_names
    "#{self.first_name} #{self.last_name}".titlecase
  end

   def self.users
    Staff.all.each do |user|
      p "#{user.full_names}  #{user.uid}"
    end
  end

  def tasks
    self.position.subdepartments.first.tasks.each do |task|
      p task.name
    end
  end

end
