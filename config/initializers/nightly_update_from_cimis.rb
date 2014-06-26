require 'rufus-scheduler'

#  The rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton
#
# s.every '24h' do
s.cron '30 11 * * *' do

  Rails.logger.info "daily CIMIS update via rufus-scheduler, at #{Time.now}"
  # Api::V1::StationsController.create_daily_temps_from_cimis
  Api::Station.create_daily_temperatures_from_cimis

end
