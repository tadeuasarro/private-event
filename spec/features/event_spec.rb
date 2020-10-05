require 'rails_helper'

RSpec.describe 'Events', type: :feature do
  describe 'Create a new event' do
    it 'It should create a new event successfully' do
      # create a new user
      u = User.new(username: 'Aragorn', email: 'aragorn@dunedain.com')
      u.save

      # login with the user
      visit sessions_new_path
      fill_in 'user_username', with: 'Aragorn'
      find("input[type='submit']").click

      # create a new event
      visit new_event_path
      fill_in 'event_name', with: 'Smash'
      fill_in 'event_location', with: 'Moria'
      fill_in 'event_date', with: Date.today
      expect(page).to have_content(//)
    end
  end
end
