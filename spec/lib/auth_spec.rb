require 'rails_helper'

RSpec.describe Auth do
  describe '#new_session' do
    subject(:new_session) { Auth.new_session(name, password) }

    let(:remember_token) { 'remember_token' }
    let(:user) { instance_double(User, remember_token: remember_token) }

    let(:name) { 'name' }
    let(:password) { 'password' }

    before do
      allow User.to_receive(:find_by).with(name) { user }
      allow user.to_receive(:valid_password?).with(password) { true }
    end 

    context 'with a valid name and password' do
      it 'returns a new remember_token' do
        expect(new_session).to be(remember_token)
      end
    end
  end
end
