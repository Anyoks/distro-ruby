# frozen_string_literal: true

# == Schema Information
#
# Table name: users
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
#  role_id                         :integer
#  tokens                          :json
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  authentication_token            :text
#  authentication_token_created_at :datetime
#  subdepartment_id                :uuid             default("46dd7aed-4aba-40ff-8bde-38674a287765"), not null
#


class User < ActiveRecord::Base
  include GraphQL::Interface
  include DeviseTokenAuth::Concerns::User
   before_save :downcase_fields
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :trackable, 
         :validatable,
         :omniauthable,
         :token_authenticatable
  
    
  # include DeviseTokenAuth::Concerns::User

  belongs_to :role
  belongs_to :subdepartment
  before_create :set_default_role, :set_uid, :skip_confirmation
  before_validation :set_default_role
  has_many :assignments
  has_many :zone_assignments
  has_many :dma_assignments
  has_many :reports, through: :assignments
  has_many :zone_reports, through: :zone_assignments
  has_many :dma_reports, through: :dma_assignments

  def downcase_fields
    self.first_name.downcase!
    self.last_name.downcase!
  end

  def set_default_role
		self.role ||= Role.find_by_name('moderator') 
  end

  def set_uid
       self.uid = self.email
  end

  def skip_confirmation
    self.skip_confirmation!
  end

  def full_names
    p"#{self.first_name} #{self.last_name}"
  end
  
  def self.users
    User.all.each do |user|
      p "#{user.full_names}  #{user.uid}"
    end
  end
end
