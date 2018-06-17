# frozen_string_literal: true

module Auth
  def self.new_session(name:, password:)
    user = User.find_by(name: name)

    user&.valid_password?(password) ? user.generate_remember_token : nil
  end

  def self.authorized_user_for(user_id:, remember_token:)
    user = User.find(user_id)
    return user if user&.valid_remember_token?(remember_token)
    nil
  end
end
