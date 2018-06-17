# frozen_string_literal: true

require 'rails_helper'

def digest(string)
  BCrypt::Password.create(string, cost: BCrypt::Engine::MIN_COST)
end

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'name', password: 'password') }

  describe '#valid_remember_token?' do
    subject(:valid_remember_token?) do
      user.valid_remember_token? provided_remember_token
    end

    let(:remember_token) { 'valid token' }

    before do
      user.update(remember_digest: digest(remember_token))
    end

    context 'when provided a valid remember token' do
      let(:provided_remember_token) { remember_token }

      it 'returns true' do
        expect(valid_remember_token?).to be(true)
      end
    end

    context 'when provided an invalid remember token' do
      let(:provided_remember_token) { 'invalid token' }

      it 'returns false' do
        expect(valid_remember_token?).to be(false)
      end
    end
  end

  describe '#valid_password?' do
    subject(:valid_password?) do
      user.valid_password? provided_password
    end

    let(:password) { 'valid password' }

    before do
      user.update(password_digest: digest(password))
    end

    context 'when provided a valid password' do
      let(:provided_password) { password }

      it 'returns true' do
        expect(valid_password?).to be(true)
      end
    end

    context 'when provided an invalid password' do
      let(:provided_password) { 'invalid password' }

      it 'returns false' do
        expect(valid_password?).to be(false)
      end
    end
  end

  describe '#generate_remember_token' do
    subject(:generate_remember_token) do
      user.generate_remember_token
    end

    let(:secure_random_string) { 'cool string' }

    before do
      allow(SecureRandom).to receive(:urlsafe_base64) { secure_random_string }
    end

    it 'returns the generate base64 token' do
      expect(generate_remember_token). to be(secure_random_string)
    end

    context 'remember_digest' do
      # Call this now, as calling it in the below variable will
      # create a new token during the comparison
      let!(:remember_token) { generate_remember_token }
      let(:remember_token_matches_remember_digest) do
        BCrypt::Password.new(user.remember_digest).is_password?(
          remember_token
        )
      end

      it 'is set as a hashed value of the remember token' do
        expect(remember_token_matches_remember_digest).to be(true)
      end
    end
  end

  describe '#clear_remember_token' do
    subject(:clear_remember_token) do
      user.clear_remember_token
    end

    before do
      user.update(remember_digest: 'foobar')
      clear_remember_token
    end

    it 'clears the user\'s remember token' do
      expect(user.remember_digest).to be(nil)
    end
  end
end
