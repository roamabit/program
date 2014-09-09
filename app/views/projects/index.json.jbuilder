json.array!(@projects) do |project|
  json.extract! project, :id, :title, :body, :published_at
  json.url project_url(project, format: :json)
end
