require 'test_helper'

module Api
  class StationApiUnitTest < ActiveSupport::TestCase
    describe "Testing connection to CIMIS api" do
      before do
        @station_nbr = "230"
        @start_date = Date.yesterday.to_s
        @end_data = (Date.yesterday - 1).to_s
      end

      it "returns a response from the CIMIS database" do
        response = HTTParty.get("http://et.water.ca.gov/api/data",
                    query: { appKey: ENV["CIMIS_API_KEY"],
                             targets: @station_nbr,
                             startDate: "2014-06-01",
                             endDate: "2014-06-02",
                             dataItems: "day-air-tmp-min,day-air-tmp-max" })
        response["Data"]["Providers"][0]["Name"].must_equal "cimis"
      end

      it "can get a CSV list of active stations" do
        Api::Station.active_station_nmbrs_to_csv.must_equal "229,230"
      end
    end
  end
end
