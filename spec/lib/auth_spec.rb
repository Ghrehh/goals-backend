# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Auth do
  describe '#new_session' do
    subject(:new_session) do
      Auth.new_session(name: name, password: password)
    end

    let(:name) { 'name' }
    let(:password) { 'password' }
    let(:remember_token) { 'remember_token' }
    let(:user) do
      instance_double(User, generate_remember_token: remember_token)
    end

    before do
      allow(User).to receive(:find_by).with(name: name) { user }
      allow(user).to receive(:valid_password?).with(password) { true }
    end

    context 'with a valid name' do
      context 'and a valid password' do
        it 'returns a new remember_token' do
          expect(new_session).to eq(
            token: remember_token,
            user: user
          )
        end
      end

      context 'and an invalid password' do
        before do
          allow(user).to receive(:valid_password?).with(password) { false }
        end

        it 'returns nil' do
          expect(new_session).to eq(
            token: nil,
            user: nil
          )
        end
      end
    end

    context 'with an invalid name' do
      before do
        allow(User).to receive(:find_by).with(name: name) { nil }
      end

      it 'returns nil' do
        expect(new_session).to eq(
          token: nil,
          user: nil
        )
      end
    end
  end

  describe '#authorized_user_for' do
    subject(:authorized_user_for) do
      Auth.authorized_user_for(
        user_id: user_id,
        remember_token: remember_token
      )
    end

    let(:user_id) { 'user_id' }
    let(:remember_token) { 'remember_token' }
    let(:user) { instance_double(User) }

    before do
      allow(User).to receive(:find).with(user_id) { user }
      allow(user).to receive(:valid_remember_token?).with(remember_token) do
        true
      end
    end

    context 'with a valid user_id' do
      context 'and a valid remember_token' do
        it 'returns the correct user' do
          expect(authorized_user_for).to be(user)
        end
      end

      context 'and an invalid remember_token' do
        before do
          allow(user).to receive(:valid_remember_token?).with(remember_token) do
            false
          end
        end

        it 'returns nil' do
          expect(authorized_user_for).to be(nil)
        end
      end
    end

    context 'with an invalid user_id' do
      before do
        allow(User).to receive(:find).with(user_id) { nil }
      end

      it 'returns nil' do
        expect(authorized_user_for).to be(nil)
      end
    end
  end
end
