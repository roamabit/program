json.array!(@search_problems) do |search_problem|
  json.extract! search_problem, :id, :user_id, :keywords, :date_min, :date_max, :location, :location_distance
  json.url search_problem_url(search_problem, format: :json)
end
