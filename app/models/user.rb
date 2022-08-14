# frozen_string_literal: true

class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :todos, dependent: :destroy
  attr_accessor :old_password
  has_secure_password validations: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validate :correct_old_password, on: :update, if: -> { password.present? }
  validate :password_presence
  validates :password, presence: true, length: { minimum: 4 }, confirmation: true, allow_blank: true
  validates :password_confirmation, presence: true, allow_blank: true

  private

  def password_presence
    errors.add(:password, :blank) unless password_digest.present?
  end

  def correct_old_password
    return if BCrypt::Password.new(password_digest_was).is_password?(old_password)

    errors.add :old_password, 'is incorrect'
  end
end
