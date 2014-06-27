require 'rufus-scheduler'
#
#  The rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton
#
s.cron '30 23 * * *' do
  # Update at 3:30am each day.
  Rails.logger.info "daily CIMIS update via rufus-scheduler, at #{Time.now}"
  Api::Station.create_daily_temperatures_from_cimis
end
