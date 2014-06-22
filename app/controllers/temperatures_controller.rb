class TemperaturesController < ApplicationController
  before_action :set_temperature, only: [:show, :edit, :update, :destroy]

  # GET /temperatures
  # GET /temperatures.json
  def index
    @temperatures = Temperature.all
  end

  # GET /temperatures/1
  # GET /temperatures/1.json
  def show
  end

  # def show_by_station_and_dates
  #   @temperatures = Temperature.where("calendar_date >= :start_date
  #                                  AND calendar_date <= :end_date
  #                                  AND station_id = :station_id",
  #                   {start_date: params[:start_date],
  #                      end_date: params[:end_date],
  #                    station_id: params[:station_id]).order(:calendar_date)
  # end

  # GET /temperatures/new
  def new
    @temperature = Temperature.new
  end

  # GET /temperatures/1/edit
  def edit
  end

  # POST /temperatures
  # POST /temperatures.json
  def create
    @temperature = Temperature.new(temperature_params)

    respond_to do |format|
      if @temperature.save
        format.html { redirect_to @temperature, notice: 'Temperature was successfully created.' }
        format.json { render :show, status: :created, location: @temperature }
      else
        format.html { render :new }
        format.json { render json: @temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /temperatures/1
  # PATCH/PUT /temperatures/1.json
  def update
    respond_to do |format|
      if @temperature.update(temperature_params)
        format.html { redirect_to @temperature, notice: 'Temperature was successfully updated.' }
        format.json { render :show, status: :ok, location: @temperature }
      else
        format.html { render :edit }
        format.json { render json: @temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temperatures/1
  # DELETE /temperatures/1.json
  def destroy
    @temperature.destroy
    respond_to do |format|
      format.html { redirect_to temperatures_url, notice: 'Temperature was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_temperature
      @temperature = Temperature.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def temperature_params
      params.require(:temperature).permit(:calendar_date, :daily_max, :daily_min, :are_valid, :station_id)
    end
end
