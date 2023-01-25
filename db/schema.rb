# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_24_112351) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_element_available_times", force: :cascade do |t|
    t.string "weekday"
    t.time "start_time"
    t.integer "openhours"
    t.bigint "booking_element_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_element_id"], name: "index_booking_element_available_times_on_booking_element_id"
  end

  create_table "booking_element_types", force: :cascade do |t|
    t.string "elementtype"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booking_elements", force: :cascade do |t|
    t.string "name"
    t.datetime "availablefrom"
    t.bigint "booking_element_type_id", null: false
    t.integer "timeslotlengthhr"
    t.boolean "renewauto"
    t.decimal "rate"
    t.integer "bookingcyclelength"
    t.boolean "isactive"
    t.bigint "site_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_element_type_id"], name: "index_booking_elements_on_booking_element_type_id"
    t.index ["site_id"], name: "index_booking_elements_on_site_id"
  end

  create_table "booking_statuses", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "booking_element_id", null: false
    t.date "bookingdate"
    t.string "bookingstatus"
    t.integer "repeatcount"
    t.string "repeatevery"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "notes"
    t.index ["booking_element_id"], name: "index_bookings_on_booking_element_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "sites", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phonenumber"
    t.string "contactperson"
    t.string "email"
    t.boolean "isactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "slots", force: :cascade do |t|
    t.bigint "booking_element_id", null: false
    t.datetime "startdatetime"
    t.datetime "enddatetime"
    t.boolean "allocated"
    t.bigint "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_element_id"], name: "index_slots_on_booking_element_id"
    t.index ["booking_id"], name: "index_slots_on_booking_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "firstname"
    t.string "lastname"
    t.string "phonenumber"
    t.boolean "isactive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "booking_element_available_times", "booking_elements"
  add_foreign_key "booking_elements", "booking_element_types"
  add_foreign_key "booking_elements", "sites"
  add_foreign_key "bookings", "booking_elements"
  add_foreign_key "bookings", "users"
  add_foreign_key "slots", "booking_elements"
end
