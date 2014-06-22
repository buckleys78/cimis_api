module Api
  class TemperaturesController < ApplicationController
    skip_before_filter :verify_authenticity_token

    respond_to :json

    def index
      # respond_with temperature_repository.all
      # binding.pry
      respond_with Temperature.all
    end

    def show
      respond_with temperature_repository.find_by_id(params[:id])
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
      params.require(:temperature).permit(:calendar_date)
    end

    def temperature_repository
      Rails.application.config.temperature_repository
    end
  end

end
