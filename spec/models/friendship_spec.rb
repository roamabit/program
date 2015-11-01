require 'rails_helper'

RSpec.describe Friendship, type: :model do
  before :each do
    @friend = Friendship.new(user_id: 1, friend_id: 1, approved: true)
  end
  
  it "is invalid without a user_id" do
    @friend.user_id = nil
    
    expect(@friend).not_to be_valid
  end

  it "is invalid without a friend_id" do
    @friend.friend_id = nil
    
    expect(@friend).not_to be_valid
  end

end
