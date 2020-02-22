class Shop < ApplicationRecord
  has_many :users

  validates_presence_of :street_address
  validates_presence_of :city
  validates_presence_of :phone_number

end
