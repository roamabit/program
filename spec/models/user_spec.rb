require 'rails_helper'

RSpec.describe User, type: :model do
   
  it "requires an email address" do
    sherlock = User.new(email: nil, password: 'elementary')

    expect(sherlock).not_to be_valid
    expect(sherlock.errors[:email].any?).to be_truthy
  end
  
  it "requires a password" do
    sherlock = User.new(email: 'sherlock@example.com', password: nil)

    expect(sherlock).not_to be_valid
    expect(sherlock.errors[:password].any?).to be_truthy
  end
end
