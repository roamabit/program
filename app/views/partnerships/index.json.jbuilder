json.array!(@partnerships) do |partnership|
  json.extract! partnership, :id
  json.url partnership_url(partnership, format: :json)
end
