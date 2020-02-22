class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.integer :zip
      t.integer :phone_number

      t.timestamps
    end
  end
end
