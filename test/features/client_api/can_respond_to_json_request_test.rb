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
      puts "STATION NBRS = #{station_nbrs}"
    end
  end

  # it "will return a response from the CIMIS database" do
  #   response = HTTParty.get("http://et.water.ca.gov/api/data",
  #               query: { appKey: ENV["CIMIS_API_KEY"],
  #                        targets: @station_nbr,
  #                        startDate: "2014-06-01",
  #                        endDate: "2014-06-02",
  #                        dataItems: "day-air-tmp-min,day-air-tmp-max" })
  #   response["Data"]["Providers"][0]["Name"].must_equal "cimis"
  # end

end
