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

ActiveRecord::Schema.define(version: 2019_05_08_181949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.bigint "platform_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_id"], name: "index_addresses_on_platform_id"
  end

  create_table "arrivals", force: :cascade do |t|
    t.string "cars"
    t.string "destination_code"
    t.string "destination_name"
    t.string "line"
    t.string "minutes"
    t.bigint "platform_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_id"], name: "index_arrivals_on_platform_id"
  end

  create_table "itineraries", force: :cascade do |t|
    t.string "source_code"
    t.string "destination_code"
    t.float "miles"
    t.integer "time"
    t.float "peak_fare"
    t.float "off_peak_fare"
    t.float "senior_fare"
    t.bigint "platform_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_id"], name: "index_itineraries_on_platform_id"
  end

  create_table "lines", force: :cascade do |t|
    t.string "color"
    t.bigint "platform_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["platform_id"], name: "index_lines_on_platform_id"
  end

  create_table "platforms", force: :cascade do |t|
    t.string "type"
    t.string "code"
    t.string "name"
    t.string "alt_code"
    t.float "lat"
    t.float "lon"
    t.datetime "arrivals_updated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "platforms"
  add_foreign_key "arrivals", "platforms"
  add_foreign_key "itineraries", "platforms"
  add_foreign_key "lines", "platforms"
end
