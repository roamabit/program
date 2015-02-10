json.array!(@simvol) do |simvol|
  json.extract! solution, :id, :name
  
  json.url simvol_url(simvol, format: :json)
  
end
