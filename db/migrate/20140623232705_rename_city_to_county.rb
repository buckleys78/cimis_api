class RenameCityToCounty < ActiveRecord::Migration
  def change
    rename_column :stations, :city, :county
  end

end
