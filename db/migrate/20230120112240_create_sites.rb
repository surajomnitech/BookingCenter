class CreateSites < ActiveRecord::Migration[7.0]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :address
      t.string :phonenumber
      t.string :contactperson
      t.string :email
      t.boolean :isactive

      t.timestamps
    end
  end
end
