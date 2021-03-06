require 'roo'
class Temperature < ActiveRecord::Base
  belongs_to :station

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |station|
        csv << station.attributes.values_at("id", "calendar_date", "daily_max", "daily_min", "are_valid", "station_id")
      end
    end
  end

  def self.import(file)
    spreadsheet_columns = [:calendar_date, :daily_max, :daily_min, :are_valid, :station_id]
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      # Careful!! Roo seems to get confused on Excel dates - it may rely on formatting,
      # not native Excel dates?  In any event, month and date can get swapped.
      # I formatted dates to YYYY-MM-DD in Excel, and the month and day stayed straight.
      #UGLY Hack to get month and date to properly parse - was coming thru swapped.
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
