require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before :each do
    @user = User.create(
      name: 'Favour',
      email: 'john1@gmail.com',
      password: '1234567',
      password_confirmation: '1234567'
    )
  end

  describe 'GET /users' do
    it 'displays forgot password' do
      visit user_session_path
      expect(page).to have_content('Forgot your password?')
    end

    it 'display sign up link' do
      visit new_user_registration_path
      expect(page).to have_content('Sign up')
    end

    it 'displays login link' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
    end
  end
end
