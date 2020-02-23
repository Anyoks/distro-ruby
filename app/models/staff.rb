# == Schema Information
#
# Table name: staffs
#
#  id                              :uuid             not null, primary key
#  provider                        :string           default("email"), not null
#  uid                             :string           default(""), not null
#  encrypted_password              :string           default(""), not null
#  reset_password_token            :string
#  reset_password_sent_at          :datetime
#  allow_password_change           :boolean          default(FALSE)
#  remember_created_at             :datetime
#  confirmation_token              :string
#  confirmed_at                    :datetime
#  confirmation_sent_at            :datetime
#  unconfirmed_email               :string
#  sign_in_count                   :integer          default(0), not null
#  current_sign_in_at              :datetime
#  last_sign_in_at                 :datetime
#  current_sign_in_ip              :inet
#  last_sign_in_ip                 :inet
#  first_name                      :string
#  last_name                       :string
#  email                           :string
#  phone_number                    :string
#  position_id                     :uuid
#  tokens                          :json
#  authentication_token            :text
#  authentication_token_created_at :datetime
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

class Staff < ApplicationRecord
    include GraphQL::Interface
    include DeviseTokenAuth::Concerns::User
     before_save :downcase_fields
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, 
         :validatable,
         :omniauthable,
         :token_authenticatable

    belongs_to :position
    has_many :assignments, dependent: :destroy
    has_many :reports, through: :assignments
    before_create :set_uid, :skip_confirmation

    def set_uid
       self.uid = self.email
  end

  def downcase_fields
    self.first_name.downcase!
    self.last_name.downcase!
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
