require 'rails_helper'

RSpec.describe 'Events', type: :model do
  describe 'Create a new event' do
    u = User.new
    it 'Should work for all attributes have been filled' do
      e = Event.new(name: 'Fiesta', location: 'Tijuana', date: Date.today, hosting_user: u)
      expect(e.valid?).to eql(true)
    end
    it 'Should work for name is not necessary' do
      e = Event.new(location: 'Tijuana', date: Date.today, hosting_user: u)
      expect(e.valid?).to eql(true)
    end
    it 'Should work for location is not necessary' do
      e = Event.new(name: 'Fiesta', date: Date.today, hosting_user: u)
      expect(e.valid?).to eql(true)
    end
    it 'Should work for date is not necessary' do
      e = Event.new(name: 'Fiesta', location: 'Tijuana', hosting_user: u)
      expect(e.valid?).to eql(true)
    end
    it 'Should not work , for hosting_user is necessary' do
      e = Event.new(name: 'Fiesta', location: 'Tijuana', date: Date.today)
      expect(e.valid?).to eql(false)
    end
  end
end
