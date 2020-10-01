require 'rails_helper'

RSpec.feature "Forms", type: :feature do
  scenario "Checking if everything is working" do
    u = User.new(username: 'tadeu', email: 'tadeu@tadeu.com')
    u.save
    expect(User.first.username).to eq('tadeu')
  end
end
