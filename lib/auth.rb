# frozen_string_literal: true

module Auth
  def self.new_session(name:, password:)
    user = User.find_by(name: name)
    is_valid = user&.valid_password?(password)

    {
      token: is_valid ? user.generate_remember_token : nil,
      user: is_valid ? user : nil
    }
  end

  def self.authorized_user_for(user_id:, remember_token:)
    user = User.find(user_id)
    return user if user&.valid_remember_token?(remember_token)
    nil
  end
end
