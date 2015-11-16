require 'rails_helper'

RSpec.describe Partnership, type: :model do
  
  it "requires a project id" do
    partnership = Partnership.new(user_id: 1, project_id: nil, role: 'friend', created_at: 2015-11-12, updated_at: 2015-11-12)

    expect(partnership).not_to be_valid
  end
  
  it "requires a user_id" do
    partnership = Partnership.new(user_id: nil, project_id: 1, role: 'friend', created_at: 2015-11-12, updated_at: 2015-11-12)

    expect(partnership).not_to be_valid
  end

  it "requires a role" do
    partnership = Partnership.new(user_id: 1, project_id: 1, role: nil, created_at: 2015-11-12, updated_at: 2015-11-12)

    expect(partnership).not_to be_valid
  end
end
