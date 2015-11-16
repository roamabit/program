require 'rails_helper'

RSpec.describe Profile, type: :model do
  
  it "requires a User ID" do
    profile = Profile.new(user_id: nil, name: "Sherlock Holmes", bio: "I'm a great detective", made_public_at: 2015-11-13, created_at: 2015-11-13, updated_at: 2015-11-13, profileable_id: 1, profileable_type: "foo")

    expect(profile).not_to be_valid
  end

  it "requires a profileable_id" do
    profile = Profile.new(user_id: 1, name: "Sherlock Holmes", bio: "I'm a great detective", made_public_at: 2015-11-13, created_at: 2015-11-13, updated_at: 2015-11-13, profileable_id: nil, profileable_type: "foo")

    expect(profile).not_to be_valid
  end

  it "requires a profileable_type" do
    profile = Profile.new(user_id: 1, name: "Sherlock Holmes", bio: "I'm a great detective", made_public_at: 2015-11-13, created_at: 2015-11-13, updated_at: 2015-11-13, profileable_id: 1, profileable_type: nil)

    expect(profile).not_to be_valid
  end

end
