json.array!(@solutions) do |solution|
  json.extract! solution, :id, :problem_id, :project_id, :solution_abstract, :published_at
  json.url solution_url(solution, format: :json)
end
