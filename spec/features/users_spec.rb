require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'Create a new user' do
    it 'Should create a new User' do
      visit new_user_path
      fill_in 'user_username', with: 'Tadeu'
      fill_in 'user_email', with: 'tadeu@example.com'
      find("input[type='submit']").click
      expect(page).to have_content(/User Tadeu created!/)
    end
  end

  describe 'Login user' do
    it "Should not login for the credentials don't exist" do
      visit sessions_new_path
      fill_in 'user_username', with: 'Obi Wan'
      find("input[type='submit']").click
      expect(page).to have_content(/Invalid Username!/)
    end
  end

  describe 'Login user' do
    u = User.new(username: 'Tadeu', email: 'tadeu@example.com')
    u.save
    it "Should login with a existing user's credentials" do
      visit sessions_new_path
      fill_in 'user_username', with: 'Tadeu'
      find("input[type='submit']").click
      expect(page).to have_content(/Logged in/)
    end
  end

  describe 'Logout user' do
    it "Should finish a user's session" do
      visit sessions_new_path
      fill_in 'user_username', with: 'Tadeu'
      find("input[type='submit']").click

      visit root_path
      click_link 'Logout'
    end
  end
end
