class Shop < ApplicationRecord
  has_many :users

  validates_presence_of :name
  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :phone_number
  validates_presence_of :zip

  def self.create_shop(params)
    Shop.create(
      street_address: params["/shops"][:street_address],
      name: params["/shops"][:name],
      city: params["/shops"][:city],
      phone_number: params["/shops"][:phone_number],
      zip: params["/shops"][:zip])
  end
end
