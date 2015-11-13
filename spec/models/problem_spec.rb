require 'rails_helper'

RSpec.describe Problem, type: :model do
  
  it "requires a statement" do
    problem = Problem.new(user_id: 1, statement: nil, body: 'This is the body', location: "Seattle, WA", created_at: 2015-11-13, updated_at: 2015-11-13)

    expect(problem).not_to be_valid
  end

  it "requires a body" do
    problem = Problem.new(user_id: 1, statement: "This is a statement", body: nil, location: "Seattle, WA", created_at: 2015-11-13, updated_at: 2015-11-13)

    expect(problem).not_to be_valid
  end

  it "requires a user_id" do
    problem = Problem.new(user_id: nil, statement: "This is a statement", body: nil, location: "Seattle, WA", created_at: 2015-11-13, updated_at: 2015-11-13)

    expect(problem).not_to be_valid
  end

  it "requires a user_id" do
    problem = Problem.new(user_id: nil, statement: "This is a statement", body: nil, location: "Seattle, WA", created_at: 2015-11-13, updated_at: 2015-11-13)

    expect(problem).not_to be_valid
  end

end
