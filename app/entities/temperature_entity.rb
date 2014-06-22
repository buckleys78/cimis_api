class TemperatureEntity

  include ActiveModel::Serializers::JSON

  attr_reader :id, :title, :director

  def initialize(attributes)
    @id       = attributes[:id]
    @station_nbr = attributes[:station_nbr]
    @calendar_date    = attributes[:calendar_date]
    @daily_max = attributes[:daily_max]
    @daily_min = attributes[:daily_min]
  end

  def attributes
    instance_values.symbolize_keys
  end

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end

end
