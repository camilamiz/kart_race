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

ActiveRecord::Schema.define(version: 2019_01_17_004147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "laps", force: :cascade do |t|
    t.time "lap_hour"
    t.integer "lap_number"
    t.time "lap_time"
    t.float "lap_average_speed"
    t.bigint "pilot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pilot_id"], name: "index_laps_on_pilot_id"
  end

  create_table "pilots", force: :cascade do |t|
    t.string "pilot_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "laps", "pilots"
end
