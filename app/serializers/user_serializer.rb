class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :password, :firstname, :lastname, :phonenumber, :isactive
  belong_to :booking
end
