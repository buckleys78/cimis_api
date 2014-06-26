require 'csv'

module Api
  class Station < ActiveRecord::Base
    has_many :temperatures

    def self.find_temperatures_for_date_range(station_nmbr, start_dt, end_dt)
      Station.select("id",
                     "station_nbr",
                     "temperatures.calendar_date",
                     "temperatures.daily_max",
                     "temperatures.daily_min",
                     "temperatures.are_valid")
            .joins(:temperatures)
            .where("station_nbr = ?", station_nmbr.to_s)
            .where("temperatures.calendar_date >= ?", start_dt.to_date)
            .where("temperatures.calendar_date <= ?", end_dt.to_date)
    end

    def self.find_all
      Station.select("id",
                     "station_nbr",
                     "name",
                     "county",
                     "is_active")
    end

    def self.create_daily_temperatures_from_cimis(station_list = nil)
      end_dt= Date.yesterday.to_s
      start_dt = (Date.yesterday - 1).to_s
      daily_temps = find_new_daily_temperatures(start_dt, end_dt, station_list)
      create_new_daily_temperatures daily_temps
    end

    def self.backfill_missing_temperatures(start_dt, end_dt, station_nbr)
      daily_temps = find_new_daily_temperatures(start_dt, end_dt, station_nbr)
      create_new_daily_temperatures daily_temps
    end

    def self.active_station_nmbrs_to_csv
      active_stations = Station.select("id", "station_nbr")
                               .where("is_active = TRUE")
      stn_arry = active_stations.map{ |s| s["station_nbr"] }
      csv_string = CSV.generate { |csv| csv << stn_arry }.chomp("\n")
    end

private

    def self.find_new_daily_temperatures(start_dt, end_dt, station_list)
      station_list = active_station_nmbrs_to_csv unless station_list
      response = HTTParty.get("http://et.water.ca.gov/api/data",
              query: { appKey: ENV["CIMIS_API_KEY"],
                       targets: station_list,
                       startDate: start_dt,
                       endDate: end_dt,
                       dataItems: "day-air-tmp-min,day-air-tmp-max" })
    end

    def self.create_new_daily_temperatures(json_response)
      json_response["Data"]["Providers"].first["Records"].each do |r|
        station = Station.find_by_station_nbr(r["Station"]) || nil
        if station
          calendar_date = r["Date"].to_date
          unless Temperature.where(station_id: station.id).find_by_calendar_date(calendar_date)
            t = Temperature.new
            t.calendar_date = calendar_date
            t.station_id = station.id
            t.daily_max = r["DayAirTmpMax"]["Value"]
            t.daily_min = r["DayAirTmpMin"]["Value"]
            #Qc returns " " if Good, "M" if missing, etc.
            t.are_valid = r["DayAirTmpMax"]["Qc"] == " " && r["DayAirTmpMin"]["Qc"] == " "
            t.save
          end
        else
          #Todo - write to error log.
        end
      end

    end

  end
end
