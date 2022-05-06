# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :password, presence: true, length: { minimum: 4 }, confirmation: true
  validates :password_confirmation, presence: true
end
