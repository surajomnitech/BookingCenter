class CreateBookingElementAvailableTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_element_available_times do |t|
      t.string :weekday
      t.time :start_time
      t.integer :openhours
      t.references :booking_element, null: false, foreign_key: true

      t.timestamps
    end
  end
end
