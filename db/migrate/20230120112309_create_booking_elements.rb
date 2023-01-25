class CreateBookingElements < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_elements do |t|
      t.string :name
      t.datetime :availablefrom
      t.references :booking_element_type, null: false, foreign_key: true
      t.integer :timeslotlengthhr
      t.boolean :renewauto
      t.decimal :rate
      t.integer :bookingcyclelength
      t.boolean :isactive
      t.references :site, null: false, foreign_key: true

      t.timestamps
    end
  end
end
