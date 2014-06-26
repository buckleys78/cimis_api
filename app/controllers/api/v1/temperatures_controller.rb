module Api
  module V1
    class TemperaturesController < ApplicationController
      skip_before_filter :verify_authenticity_token

      respond_to :json

      def index
        # respond_with temperature_repository.all
        # binding.pry
        # station =
        respond_with Station.joins(:temperature).where("station_nbr = ?", params[:station_nbr])
        # respond_with Temperature.where("calendar_date = ?", params[:start_date]).includes(:station)
        binding.pry
        # respond_with Temperature.where("station_nbr = ?", params[:station_nbr])
      end

      def show
#         binding.pry
#         dummy = Temperature.find_by_id(params[:id])

        # query = "SELECT temperatures.*, stations.station_nbr as station_nbr
# FROM "temperatures" INNER JOIN "stations" ON "stations"."id" = "temperatures"."station_id"
# ORDER BY stations.station_nbr"
#         results = ActiveRecord::Base.connection.execute(query)
#         respond_with results
      end

      # def update
      #   respond_with temperature_repository.update(params[:id], temperature_params)
      # end

      # def create
      #   # TODO: Respond with the location of the resource
      #   respond_with temperature_repository.create(temperature_params), location: nil
      # end

      # def destroy
      #   respond_with temperature_repository.destroy(params[:id])
      # end

private

      def temperature_params
        # params[:station_nbr, :start_date, :end_date ]
        params.require(:temperature).permit(:station_nbr, :start_date, :end_date )

      end

      def temperature_repository
        Rails.application.config.temperature_repository
      end
    end
  end
end
