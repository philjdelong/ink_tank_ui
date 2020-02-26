class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone_number
      t.string :status
      t.string :amount
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
