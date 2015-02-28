require 'rails_helper'

RSpec.describe User, type: :model do
  it "should allow a user to log in" do
    u = User.create(email: 'person@person.com', password: 'pass123', nickname: 'Guy')
      login_attempt = u.authenticate('pass123')
      expect(login_attempt).to be_an_instance_of (User)
      expect(login_attempt).to eq(u)
  end

  it 'should have a flowery description when referenced by to_s' do
    u = User.create(email: 'someguy@where.com', password: 'pass123')
    expect(u.to_s).to eq("This person's email is someguy@where.com")
  end

end