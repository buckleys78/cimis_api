require 'test_helper'

describe "Testing nightly updates from CIMIS" do
  before :each do
    @station_nbrs = "229,230,231"
  end

  it "will can add unique but not duplicate temperature records" do
    original_count = Temperature.count
    # add two records
    Api::Station.create_daily_temperatures_from_cimis @station_nbrs
    Temperature.count.must_equal original_count + 4
    # try to add them again, should not make count increase.
    Api::Station.create_daily_temperatures_from_cimis @station_nbrs
    Temperature.count.must_equal original_count + 4
  end

end
