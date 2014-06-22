class MakeStationIdUnique < ActiveRecord::Migration
  def change
    add_index :stations, :station_nbr, :unique => true
  end
end
