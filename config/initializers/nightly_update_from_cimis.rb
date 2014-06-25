require 'rufus-scheduler'

# Let's use the rufus-scheduler singleton
#
s = Rufus::Scheduler.singleton


# Stupid recurrent task...
#
s.every '1m' do

  # Rails.logger.info "hello from rufus-scheduler, it's #{Time.now}"
  create_daily_temps_from_cimis
end
