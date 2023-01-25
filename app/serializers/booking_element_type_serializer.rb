class BookingElementTypeSerializer
  include JSONAPI::Serializer
  attributes :elementtype
  belongs_to :booking_element
end
