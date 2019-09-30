# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :uuid             not null, primary key
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  allow_password_change  :boolean          default(FALSE)
#  remember_created_at    :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  first_name             :string
#  last_name              :string
#  email                  :string
#  role_id                :integer
#  tokens                 :json
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#


class User < ActiveRecord::Base
  include GraphQL::Interface
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
  before_create :set_default_role
  before_validation :set_default_role

  def set_default_role
		self.role ||= Role.find_by_name('moderator') 
	end
end
