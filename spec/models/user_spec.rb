require 'rails_helper'

RSpec.describe 'Users', type: :model do
  describe 'Create a new user' do
    it "it should create an user without username for it's not necessary" do
      u1 = User.new(email: 'tadeu@example.com')
      expect(u1.valid?).to eql(true)
    end
    it "it should create an user without email for it's not necessary" do
      u1 = User.new(username: 'tadeu')
      expect(u1.valid?).to eql(true)
    end
    it 'it should create an user with both attributes' do
      u1 = User.new(username: 'tadeu', email: 'tadeu@example.com')
      expect(u1.valid?).to eql(true)
    end
  end
end
