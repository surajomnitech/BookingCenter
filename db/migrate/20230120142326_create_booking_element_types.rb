class CreateBookingElementTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :booking_element_types do |t|
      t.string :elementtype

      t.timestamps
    end
  end
end
