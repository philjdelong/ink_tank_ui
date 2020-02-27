class Style < ApplicationRecord
   validates_presence_of :name
   validates_presence_of :description

   has_many :artist_styles
   has_many :users, through: :artist_styles
end