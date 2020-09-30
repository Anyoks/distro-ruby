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
    has_many :zone_assignments
    has_many :dma_assignments

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

  def undone_dma_assignments
    assignments = self.dma_assignments.where("id NOT IN (SELECT  dma_assignment_id FROM dma_reports)")
    # TODO make this a job that runs later in the background
    self.update_assignment_stage(assignments)
    return assignments
  end

  def undone_zone_assignments
    assignments = self.zone_assignments.where("id NOT IN (SELECT  zone_assignment_id FROM zone_reports)")
    # TODO make this a job that runs later in the background
    self.update_assignment_stage(assignments)
    return assignments
  end

  def undone_account_assignments
    assignments = self.assignments.where("id NOT IN (SELECT  assignment_id FROM account_reports)")
    # TODO make this a job that runs later in the background
    self.update_assignment_stage(assignments)
    return assignments
  end

  def undone_assignments
    assignments = self.assignments.where("id NOT IN (SELECT  assignment_id FROM account_reports)")
    # TODO make this a job that runs later in the background
    self.update_assignment_stage(assignments)
    return assignments
  end



  def done_assignments
    self.assignments.where("id IN (SELECT  assignment_id FROM account_reports)")
  end

  def total_assignments
    self.assignments.count + self.dma_assignments.count + self.zone_assignments.count
  end
  def total_un_done_assignments
    self.undone_account_assignments.count + self.undone_dma_assignments.count + self.undone_zone_assignments.count
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

  def update_assignment_stage(assignments)
    p "IN THE UPDATE ASS"
    # assignments.each do |ass|
    #   if ass.stage.name == 'assign'
    #     logger.debug "Pending"	
    
    #     ass.update_attributes(stage_id: Stage.where(name: "pending").first.id )
    #   end
    # end
  end

end
