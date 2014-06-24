require 'roo'
class Station < ActiveRecord::Base
  has_many :temperatures

  def self.to_csv(options = {})
    # column_names = [:id, :station_nbr, :name, :county, :is_active]
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |station|
        csv << station.attributes.values_at("id", "station_nbr", "name", "county", "is_active")
      end
    end
  end

  def self.import(file)
    spreadsheet_columns = [:station_nbr, :name, :county, :is_active]
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      station = find_by_id(row["id"]) || new
      station.attributes = row
      station.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
