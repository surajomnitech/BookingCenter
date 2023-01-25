class SiteSerializer
  include JSONAPI::Serializer
  attributes :name, :address, :phonenumber, :contactperson, :email, :isactive

  has_many :booking_elements
  
end
