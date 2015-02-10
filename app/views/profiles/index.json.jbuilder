json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :bio, :made_public_at
  json.url profile_url(profile, format: :json)
end
