require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton


# Stupid recurrent task...
#
s.every '1m' do

  # Rails.logger.info "hello from rufus-scheduler, it's #{Time.now}"
  # Api::V1::StationsController.create_daily_temps_from_cimis
  # Api::Station.create_daily_temperatures_from_cimis
end
