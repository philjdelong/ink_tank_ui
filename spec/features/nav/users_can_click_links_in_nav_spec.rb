require 'rails_helper'

RSpec.describe "A visitor" do
   it "can click links in the nav bar" do
      visit "/"

      within "nav" do
         expect(page).to have_link("Artists")
         expect(page).to have_link("Locations")
         expect(page).to have_link("Styles")
         expect(page).to have_link("Login with Google")
      end
   end
end
