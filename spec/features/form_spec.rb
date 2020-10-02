require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.feature 'Forms', type: :feature do
  scenario 'User should be valid without email, for its not required' do
    u1 = User.new(username: 'tadeu')
    expect(u1.valid?).to eq(true)
  end
  scenario 'User should be valid without username, for its not required' do
    u2 = User.new(email: 'tadeu@tadeu.com')
    expect(u2.valid?).to eq(true)
  end

  scenario 'Event should be valid without name, for its not required' do
    e1 = Event.new(location: 'Tijuana', date: '2020/10/02', hosting_user: User.new)
    expect(e1.valid?).to eq(true)
  end
  scenario 'Event should be valid without location, for its not required' do
    e2 = Event.new(name: 'Tadeu', date: '2020/10/02', hosting_user: User.new)
    expect(e2.valid?).to eq(true)
  end
  scenario 'Event should be valid without date, for its not required' do
    e3 = Event.new(name: 'Tadeu', location: 'Tijuana', hosting_user: User.new)
    expect(e3.valid?).to eq(true)
  end
  scenario 'Event should be invalid, for it has no hosting_user' do
    e4 = Event.new(name: 'Tadeu', location: 'Tijuana', date: '2020/10/02')
    expect(e4.valid?).to eq(false)
  end

  scenario 'Invitation should be invalid for it has no invited_user_id' do
    i1 = Invitation.new(event_id: 1)
    expect(i1.valid?).to eq(false)
  end
  scenario 'Invitation should be invalid for it has no event_id' do
    i2 = Invitation.new(invited_user_id: 1)
    expect(i2.valid?).to eq(false)
  end
  scenario 'Invitation should be valid' do
    u = User.new(username: 'tadeu', email: 'tadeu@tadeu.com')
    u.save
    u1 = User.new(username: 'maria', email: 'maria@maria.com')
    u1.save
    e = Event.new(name: 'Fiesta', location: 'Tijuana', date: '2020/10/02', hosting_user: u)
    e.save
    i3 = Invitation.new(invited_user_id: 2, event_id: 1)
    expect(i3.valid?).to eq(true)
  end
end

# rubocop:enable Metrics/BlockLength
