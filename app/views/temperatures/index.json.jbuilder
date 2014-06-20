json.array!(@temperatures) do |temperature|
  json.extract! temperature, :id, :calendar_date, :daily_max, :daily_min, :are_valid
  json.url temperature_url(temperature, format: :json)
end
