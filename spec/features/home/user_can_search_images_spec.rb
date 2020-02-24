require 'rails_helper'

RSpec.describe "As a user" do
   describe "when i visit the home page" do
      it "i can search for images in the search field" do
         visit "/"

         expect(page).to_not have_css(".images")
         
         fill_in "Search tattoos", with: "Black and White"
         click_on "Find Images"
         expect(current_path).to eq("/")
         
         expect(page).to have_css(".image", count: 30)
      end
   end
end