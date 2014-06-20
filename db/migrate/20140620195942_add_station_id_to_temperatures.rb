class AddStationIdToTemperatures < ActiveRecord::Migration
  def change
    add_column :temperatures, :station_id, :integer
    add_index  :temperatures, :station_id
  end
end
