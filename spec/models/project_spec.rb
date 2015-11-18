require 'rails_helper'

RSpec.describe Project, type: :model do

  it "requires a title" do
    project = Project.new(title: nil, body: "Project body", created_at: 2015-11-13, updated_at: 2015-11-13)
  end

    it "requires a body" do
    project = Project.new(title: 'Project Title', body: nil, created_at: 2015-11-13, updated_at: 2015-11-13)
    end
end
