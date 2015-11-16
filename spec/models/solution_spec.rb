require 'rails_helper'

RSpec.describe Solution, type: :model do
  
  it "requires a Problem ID" do
    solution = Solution.new(problem_id: nil, project_id: 1, solution_abstract: 'solution abstract', published_at: 2015-11-13, created_at: 2015-11-13, updated_at: 2015-11-13)

    expect(solution).not_to be_valid
  end

    it "requires a Project ID" do
    solution = Solution.new(problem_id: 1, project_id: nil, solution_abstract: 'solution abstract', published_at: 2015-11-13, created_at: 2015-11-13, updated_at: 2015-11-13)

    expect(solution).not_to be_valid
  end

end
