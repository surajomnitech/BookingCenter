# t.bigint "user_id", null: false
# t.bigint "booking_element_id", null: false
# t.date "bookingdate"
# t.string "bookingstatus"
# t.integer "repeatcount"
# t.string "repeatevery"
# t.datetime "created_at", null: false
# t.datetime "updated_at", null: false
# t.string "notes"

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :booking_element
end
