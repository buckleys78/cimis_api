class TemperatureRepository

  # def create(attributes)
  #   created_temperature = Api::Temperature.create(attributes)

  #   TemperatureEntity.new(
  #     :id             => created_temperature.id
  #     :calendar_date  => created_temperature.calendar_date
  #     :daily_max      => created_temperature.daily_max
  #     :daily_min      => created_temperature.daily_min
  #     :station_nbr    => created_temperature.station_nbr
  #   )
  # end

  # def update(id, attributes)
  #   updated_temperature = Api::Temperature.update(id, attributes)

  #   TemperatureEntity.new(
  #     :id             => created_temperature.id
  #     :calendar_date  => created_temperature.calendar_date
  #     :daily_max      => created_temperature.daily_max
  #     :daily_min      => created_temperature.daily_min
  #     :station_nbr    => created_temperature.station_nbr
  #   )
  # end

  def find_by_id(id)
    found_temperature = Api::Temperature.find(id)

    TemperatureEntity.new(
      :id             => created_temperature.id
      :calendar_date  => created_temperature.calendar_date
      :daily_max      => created_temperature.daily_max
      :daily_min      => created_temperature.daily_min
      :station_nbr    => created_temperature.station_nbr
    )
  end

  # def destroy(movie_id)
  #   destroyed_temperature = Api::Temperature.destroy(temperature_id)

  #   TemperatureEntity.new(
  #     :id             => created_temperature.id
  #     :calendar_date  => created_temperature.calendar_date
  #     :daily_max      => created_temperature.daily_max
  #     :daily_min      => created_temperature.daily_min
  #     :station_nbr    => created_temperature.station_nbr
  #   )
  # end

  def all
    Api::Temperature.all.map do |m|
      TemperatureEntity.new(
      :id             => created_temperature.id
      :calendar_date  => created_temperature.calendar_date
      :daily_max      => created_temperature.daily_max
      :daily_min      => created_temperature.daily_min
      :station_nbr    => created_temperature.station_nbr
      )
    end
  end

end
