# t.string "weekday"
# t.time "start_time"
# t.integer "openhours"
# t.bigint "booking_element_id", null: false
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false

class BookingElementAvailableTime < ApplicationRecord
  belongs_to :booking_element
end
