class BookingElementSerializer
  include JSONAPI::Serializer
  attributes :name, :availablefrom, :timeslotlengthhr, :renewauto, :rate, :site, :booking_element_type, :bookingcyclelength, :isactive,
   :booking_element_available_times, :slots

  belongs_to :booking_element_type
  belongs_to :site
  has_many :booking_element_available_times
  has_many :slots
end
