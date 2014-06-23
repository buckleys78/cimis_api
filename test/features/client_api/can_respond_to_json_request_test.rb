require 'test_helper'

class StationsTest < ActionDispatch::IntegrationTest

  describe "GET /stations" do
    it "returns all the stations" do
      get "/stations", {}, { "Accept" => "application/json" }

      response.success?.must_equal true
      response.status.must_equal 200

      body = JSON.parse(response.body)

      station_nbrs = body.map { |s| s["station_nbr"] }
      station_nbrs.must_equal ["8", "15"]
    end
  end
end

class TemperaturesTest < ActionDispatch::IntegrationTest
  describe "GET /temperatures" do
    it "returns all the temperatures" do
      get "/temperatures", {}, { "Accept" => "application/json" }

      response.success?.must_equal true
      response.status.must_equal 200

      body = JSON.parse(response.body)

      daily_max_temps = body.map { |t| t["daily_max"] }
      daily_max_temps.must_equal ["89.1", "87.2", "90.0"]
    end
  end

  describe "GET /api/v1/stations/" do
    it "returns the temperatures for a given station_nbr and date range" do
      params = { "station_nbr" => stations(:one).station_nbr,
                 "start_date"  => temperatures(:one).calendar_date,
                 "end_date"    => temperatures(:two).calendar_date}.to_json

      get "/api/v1/stations", params, { "Accept" => "application/json" }

      response.success?.must_equal true
      response.status.must_equal 200

      body = JSON.parse(response.body)

      daily_max_temps = body.map { |t| t["daily_max"] }
      daily_max_temps.must_equal [temperatures(:one).daily_max,
                                  temperatures(:two).daily_max]
    end
  end
end

