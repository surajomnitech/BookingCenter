class CreateSlots < ActiveRecord::Migration[7.0]
  def change
    create_table :slots do |t|
      t.references :booking_element, null: false, foreign_key: true
      t.datetime :startdatetime
      t.datetime :enddatetime
      t.boolean :allocated
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
