# frozen_string_literal: true

# == Schema Information
#
# Table name: accounts
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_accounts_on_email                 (email) UNIQUE
#  index_accounts_on_reset_password_token  (reset_password_token) UNIQUE
#

class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  serialize :schools, Array

  before_create :reset_authentication_token
  before_save :ensure_authentication_token
  before_create :ensure_authentication_token

  ROLE = %w[អ្នកគ្រប់គ្រង អ្នកប្រឹក្សាយោបល់].freeze

  def role
    is_admin ? Account::ROLE[0] : Account::ROLE[1]
  end

  def users
    if is_admin
      User.all
    else
      User.where('school_name = ?', schools[0])
    end
  end

  private

  def reset_authentication_token
    self.authentication_token = nil
    self.token_expired_date = Time.now
  end

  def ensure_authentication_token
    self.authentication_token = Devise.friendly_token
    self.token_expired_date = Time.now + 2.week
  end

  def refresh_authentication_token
    ensure_authentication_token
    save!
  end
end
