# t.string "name"
# t.string "address"
# t.string "phonenumber"
# t.string "contactperson"
# t.string "email"
# t.boolean "isactive"

class Site < ApplicationRecord
    validates :name, presence: true, length: {minimum: 4, maximum:100 } 
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :phonenumber, presence: true, length: {minimum: 10} 

    has_many :booking_elements
end
