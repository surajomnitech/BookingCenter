class AddNotesToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :notes, :string
  end
end
