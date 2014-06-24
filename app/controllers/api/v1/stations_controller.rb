module Api
  module V1
    class StationsController < ApplicationController
      skip_before_filter :verify_authenticity_token

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

private

      def stations_params
        params.require(:station).permit(:station_nbr, :start_date, :end_date )
      end

    end
  end
end
