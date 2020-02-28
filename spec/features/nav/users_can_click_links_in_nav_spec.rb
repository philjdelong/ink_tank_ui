require 'rails_helper'

RSpec.describe "A visitor" do
   it "can click links in the nav bar" do
      visit "/"

      within "nav" do
         expect(page).to have_link("Artists")
         expect(page).to have_link("Locations")
         expect(page).to have_link("Login with Google")
      end
      expect(current_path).to eq("/")
   end

   it "has bad advice" do
     visit "/"

     within "nav" do
        expect(page).to have_link("Bad Advice")
        click_on "Bad Advice"
     end
     expect(current_path).to eq("/advice")
   end
end
