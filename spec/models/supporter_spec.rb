require 'rails_helper'

RSpec.describe Supporter, type: :model do
  
  it "requires a problem_id" do
    supporter = Supporter.new(user_id: 1, problem_id: nil, role: 'friend', created_at: 2015-11-12, updated_at: 2015-11-12)

    expect(supporter).not_to be_valid
  end
  
  it "requires a user_id" do
    supporter = Supporter.new(user_id: nil, problem_id: 1, role: 'friend', created_at: 2015-11-12, updated_at: 2015-11-12)

    expect(supporter).not_to be_valid
  end

  it "requires a role" do
    supporter = Supporter.new(user_id: 1, problem_id: 1, role: nil, created_at: 2015-11-12, updated_at: 2015-11-12)

    expect(supporter).not_to be_valid
  end
end
