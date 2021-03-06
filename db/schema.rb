# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140623232705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "stations", force: true do |t|
    t.string   "station_nbr"
    t.string   "name"
    t.string   "county"
    t.boolean  "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stations", ["station_nbr"], name: "index_stations_on_station_nbr", unique: true, using: :btree

  create_table "temperatures", force: true do |t|
    t.date     "calendar_date"
    t.decimal  "daily_max"
    t.decimal  "daily_min"
    t.boolean  "are_valid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "station_id"
  end

  add_index "temperatures", ["station_id"], name: "index_temperatures_on_station_id", using: :btree

end
