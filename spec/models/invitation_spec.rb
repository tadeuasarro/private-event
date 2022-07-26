require 'rails_helper'

RSpec.describe 'Invitation', type: :model do
  describe 'Create new invitations' do
    u = User.new
    u.save
    e = Event.new(hosting_user: u)
    e.save
    it 'Should work for everything is set correctly' do
      i = Invitation.new(invited_user_id: 1, event_id: 1)
      expect(i.valid?).to eql(true)
    end
    it "Should not work for it doesn't have a invited user" do
      i = Invitation.new(event_id: 1)
      expect(i.valid?).to eql(false)
    end
    it "Should not work for it doesn't have a event" do
      i = Invitation.new(invited_user_id: 1)
      expect(i.valid?).to eql(false)
    end
  end
end
