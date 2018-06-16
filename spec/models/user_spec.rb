require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { User.create(name: 'name', password: 'password') }

  describe '#valid_remember_token?' do
  end
end
