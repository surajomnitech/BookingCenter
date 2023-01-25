class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :booking_element, null: false, foreign_key: true
      t.date :bookingdate
      t.string :bookingstatus
      t.integer :repeatcount
      t.string :repeatevery

      t.timestamps
    end
  end
end
