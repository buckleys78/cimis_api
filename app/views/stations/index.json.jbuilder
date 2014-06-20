json.array!(@stations) do |station|
  json.extract! station, :id, :station_nbr, :name, :city, :is_active
  json.url station_url(station, format: :json)
end
