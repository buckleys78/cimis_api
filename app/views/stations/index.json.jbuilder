json.array!(@stations) do |station|
  json.extract! station, :id, :station_nbr, :name, :county, :is_active
  json.url station_url(station, format: :json)
end
