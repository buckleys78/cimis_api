namespace :load_temps do
  desc "loads the temperatures for all the stations"
  task :load_all_stns, [:start_dt, :end_dt] => :environment do |t, args|
    Station.connection
    Station.find_each do |s|
      if s.is_active
        Api::Station.backfill_missing_temperatures(args[:start_dt], args[:end_dt], s.station_nbr)
        puts "loaded stn #{s.station_nbr}"
      end
    end
  end

  desc "loads one station"
  # Call with: $ rake loadtemps:load_one_stn['start_dt,'end_dt','stn_nbr']
  task :load_one_stn, [:station_nbr,:start_dt,:end_dt] => :environment do |t, args|
    Api::Station.backfill_missing_temperatures(args[:start_dt], args[:end_dt], args[:station_nbr])
  end

end
