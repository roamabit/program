json.array!(@problems) do |problem|
  json.extract! problem, :id, :statement, :body, :published_at, :location
  json.url problem_url(problem, format: :json)
end
