class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.string :description
      t.boolean :paid
      t.string :client_name
      t.string :client_email
      t.references :user, foreign_key: true
    end
  end
end
