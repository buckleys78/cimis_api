require 'test_helper'

# class TemperaturesControllerTest < ActionController::TestCase
#   setup do
#     @temperature = temperatures(:one)
#   end

describe "Testing nightly updates from CIMIS" do
  before do
    @station_nbrs = "229,230,231"
  end

  it "can update the db with new temperatures" do
    original_count = Temperature.where(station_id: Station.find_by_station_nbr("229").id).count
    Api::Station.create_daily_temperatures_from_cimis @station_nbrs
    Temperature.where(station_id: Station.find_by_station_nbr("229").id).count.must_equal original_count + 2
  end

  it "will not add duplicate records" do
    original_count = Temperature.where(station_id: Station.find_by_station_nbr("229").id).count
    # add two records
    Api::Station.create_daily_temperatures_from_cimis @station_nbrs

    Temperature.where(station_id: Station.find_by_station_nbr("229").id).count.must_equal original_count + 2
    # try to add them again, should not make count increase.
    Api::Station.create_daily_temperatures_from_cimis @station_nbrs
    Temperature.where(station_id: Station.find_by_station_nbr("229").id).count.must_equal original_count + 2
  end


end
