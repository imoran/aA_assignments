require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'should check for the presence of username' do
      should validate_presence_of(:username)
    end

    it 'should check for the presence of password_digest' do
      should validate_presence_of(:password_digest)
    end

    it 'should make sure password length is at least 6 characters' do
      should validate_length_of(:password).is_at_least(6)
    end
  end

  describe 'associations' do
    it 'user should have many goals' do
      should have_many(:goals)
    end
  end

  describe 'User::find_by_credentials' do
    it 'should find a user by their credentials' do
      potato = User.create!(username: 'sweet_potato', password: 'password')

      me = User.find_by_credentials(username: 'sweet_potato', password: 'password')

      expect(me).to eq(potato)
    end
  end

end
