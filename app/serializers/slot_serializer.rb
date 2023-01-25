class SlotSerializer
  include JSONAPI::Serializer
  attributes :booking_element, :startdatetime, :enddatetime, :allocated, :booking
  belongs_to :booking_element
  belongs_to :booking
end
