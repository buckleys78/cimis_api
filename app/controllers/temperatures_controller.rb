class TemperaturesController < ApplicationController
  before_action :set_temperature, only: [:show, :edit, :update, :destroy]
  before_action :load_station, except: [:index, :import, :create, :new]

  # GET /temperatures
  # GET /temperatures.json
  def index
    @temperatures = Temperature.all
    respond_to do |format|
      format.html
      format.json
      format.csv { render text: @temperatures.to_csv }
      format.xls { send_data @temperatures.to_csv(col_sep: "\t") }
    end
  end

  def import
    Temperature.import(params[:file])
    flash[:notice] = "Temperatures imported."
    redirect_to root_url
  end

  # GET /temperatures/1
  # GET /temperatures/1.json
  def show
  end

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
        # format.json { render :show, status: :created, location: @temperature }
      else
        format.html { render :new }
        # format.json { render json: @temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_from_batch

  end

  # PATCH/PUT /temperatures/1
  # PATCH/PUT /temperatures/1.json
  def update
    respond_to do |format|
      if @temperature.update(temperature_params)
        format.html { redirect_to @temperature, notice: 'Temperature was successfully updated.' }
        # format.json { render :show, status: :ok, location: @temperature }
      else
        format.html { render :edit }
        # format.json { render json: @temperature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temperatures/1
  # DELETE /temperatures/1.json
  def destroy
    @temperature.destroy
    respond_to do |format|
      format.html { redirect_to temperatures_url, notice: 'Temperature was successfully destroyed.' }
      # format.json { head :no_content }
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

    def load_station
      @station = Station.find(@temperature.station_id)
    end
end
