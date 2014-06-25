module Api
  module V1
    class StationsController < ApplicationController
      skip_before_filter :verify_authenticity_token
      before_filter :cors_preflight_check
      after_filter :cors_set_access_control_headers

      respond_to :json

      def index
        if params[:station_nbr]
          respond_with Station.select("station_nbr",
                                      "temperatures.calendar_date",
                                      "temperatures.daily_max",
                                      "temperatures.daily_min")
                              .joins(:temperatures)
                              .where("station_nbr = ?", params[:station_nbr].to_s)
                              .where("temperatures.calendar_date >= ?", params[:start_date].to_date)
                              .where("temperatures.calendar_date <= ?", params[:end_date].to_date)
        else
          respond_with Station.select("station_nbr",
                                      "name",
                                      "county",
                                      "is_active")
        end
      end

      def create_daily_temps_from_cimis
        start_dt = Date.yesterday.to_s
        end_dt = (Date.yesterday - 1).to_s
        station_nbrs = "229,230,231"
        response = HTTParty.get("http://et.water.ca.gov/api/data",
                query: { appKey: ENV["CIMIS_API_KEY"],
                         targets: station_nbrs,
                         startDate: start_dt,
                         endDate: end_dt,
                         dataItems: "day-air-tmp-min,day-air-tmp-max" })
        puts "CREATE_DAILY_TEMPS RESPONSE = #{response}"
      end



private

      def stations_params
        params.require(:station).permit(:station_nbr, :start_date, :end_date )
      end

        # For all responses in this controller, return the CORS access control headers.
      def cors_set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
        headers['Access-Control-Request-Method'] = '*'
        headers['Access-Control-Max-Age'] = "1728000"
      end

      # If this is a preflight OPTIONS request, then short-circuit the
      # request, return only the necessary headers and return an empty
      # text/plain.

      def cors_preflight_check
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
        headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version'
        headers['Access-Control-Max-Age'] = '1728000'
      end
    end
  end
end
