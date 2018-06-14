class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true, uniqueness: true

  def generate_remember_token
    token = SecureRandom.urlsafe_base64
    self.update(remember_digest: digest(token))
    token
  end

  def clear_remember_token
    self.update(remember_digest: nil)
  end

  def validate(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  private

  def digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
