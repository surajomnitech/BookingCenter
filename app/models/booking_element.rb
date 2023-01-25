# t.string "name"
# t.datetime "availablefrom"
# t.bigint "booking_element_type_id", null: false
# t.integer "timeslotlengthhr"
# t.boolean "renewauto"
# t.decimal "rate"
# t.integer "bookingcyclelength"
# t.boolean "isactive"
# t.bigint "site_id", null: false
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.index ["booking_element_type_id"], name: "index_booking_elements_on_booking_element_type_id"
# t.index ["site_id"], name: "index_booking_elements_on_site_id"

class BookingElement < ApplicationRecord
  belongs_to :booking_element_type
  belongs_to :site
  has_many :booking_element_available_times
  has_many :slots
end
