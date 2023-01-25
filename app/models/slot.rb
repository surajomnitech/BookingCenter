# t.bigint "booking_element_id", null: false
# t.datetime "startdatetime"
# t.datetime "enddatetime"
# t.boolean "allocated"
# t.bigint "booking_id", null: false

class Slot < ApplicationRecord
  belongs_to :booking_element
  #belongs_to :booking
end
