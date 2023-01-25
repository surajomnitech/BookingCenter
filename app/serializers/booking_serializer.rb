class BookingSerializer
  include JSONAPI::Serializer
  attributes :user, :booking_element, :bookingdate, :bookingstatus, :repeatcount, :repeatevery, :notes
  #, :slots
  #belong_to :booking_element
  #belong_to :user
  #has_many :slots
end
