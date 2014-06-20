class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.string :station_nbr
      t.string :name
      t.string :city
      t.boolean :is_active

      t.timestamps
    end
  end
end
