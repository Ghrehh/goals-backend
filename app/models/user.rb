# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, uniqueness: true
  has_many :goals

  def valid_remember_token?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def valid_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def generate_remember_token
    token = SecureRandom.urlsafe_base64
    update(remember_digest: digest(token))
    token
  end

  def clear_remember_token
    update(remember_digest: nil)
  end

  private

  def digest(string)
    BCrypt::Password.create(string, cost: digest_cost)
  end

  def digest_cost
    return BCrypt::Engine.cost unless ActiveModel::SecurePassword.min_cost
    BCrypt::Engine::MIN_COST
  end
end
