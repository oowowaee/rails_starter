# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  name                   :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  role                   :integer          default(1), not null
#  locale                 :string(255)      default("en"), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable
  devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable

  validates :name, :presence => true, length: { minimum: 5 }

  ROLES = %i[user admin]
  LOCALES = %i[en fr]

  def admin?
    role == 2
  end

  #https://github.com/plataformatec/devise/wiki/How-To:-Override-confirmations-so-users-can-pick-their-own-passwords-as-part-of-confirmation-activation
  # new function to set the password without knowing the current 
  # password used in our confirmation controller. 
  def attempt_set_password(params)
    p = {}
    p[:password] = params[:password]
    p[:password_confirmation] = params[:password_confirmation]
    update_attributes(p)
  end

  # new function to return whether a password has been set
  def has_no_password?
    self.encrypted_password.blank?
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end

  # Devise::Models:unless_confirmed` method doesn't exist in Devise 2.0.0 anymore. 
  # Instead you should use `pending_any_confirmation`.  
  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end

  def password_required?
    # Password is required if it is being set, but not for new records
    if !persisted? 
      false
    else
      !password.nil? || !password_confirmation.nil?
    end
  end
end
