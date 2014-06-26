# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Station.delete_all
# Temperature.delete_all

# stations = Station.create!([{ station_nbr: "2", name: "FivePoints", county: "Fresno", is_active: true },
#                             { station_nbr: "5", name: "Shafter", county: "Kern", is_active: true },
#                             { station_nbr: "6", name: "Davis", county: "Yolo", is_active: true },
#                             { station_nbr: "7", name: "Firebaugh", county: "Fresno", is_active: true },
#                             { station_nbr: "8", name: "Gerber", county: "Tehama", is_active: true }])



Temperature.create!([{ calendar_date: "2014-06-14", daily_max: 89.7, daily_min: 50.7, are_valid: true, station_id: 268 },
                     { calendar_date: "2014-06-15", daily_max: 89.1, daily_min: 55.0, are_valid: true, station_id: 268 },
                     { calendar_date: "2014-06-16", daily_max: 84.7, daily_min: 53.9, are_valid: true, station_id: 268 },
                     { calendar_date: "2014-06-17", daily_max: 81.2, daily_min: 46.1, are_valid: true, station_id: 268 },
                     { calendar_date: "2014-06-18", daily_max: 88.8, daily_min: 50.7, are_valid: true, station_id: 268 },
                     { calendar_date: "2014-06-19", daily_max: 94.2, daily_min: 56.0, are_valid: true, station_id: 268 },
                     { calendar_date: "2014-06-20", daily_max: 94.0, daily_min: 56.4, are_valid: true, station_id: 268 }])

Temperature.create!([{ calendar_date: "2014-06-14", daily_max: 86.9, daily_min: 54.4, are_valid: true, station_id: 271 },
                     { calendar_date: "2014-06-15", daily_max: 89.3, daily_min: 56.2, are_valid: true, station_id: 271 },
                     { calendar_date: "2014-06-16", daily_max: 84.8, daily_min: 54.1, are_valid: true, station_id: 271 },
                     { calendar_date: "2014-06-17", daily_max: 82.1, daily_min: 51.5, are_valid: true, station_id: 271 },
                     { calendar_date: "2014-06-18", daily_max: 87.4, daily_min: 52.1, are_valid: true, station_id: 271 },
                     { calendar_date: "2014-06-19", daily_max: 94.4, daily_min: 55.1, are_valid: true, station_id: 271 },
                     { calendar_date: "2014-06-20", daily_max: 93.4, daily_min: 56.3, are_valid: true, station_id: 271 }])
