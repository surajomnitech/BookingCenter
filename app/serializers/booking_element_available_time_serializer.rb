class BookingElementAvailableTimeSerializer
  include JSONAPI::Serializer
  attributes :weekday, :start_time, :openhours, :booking_element
  belongs_to :booking_element
end
