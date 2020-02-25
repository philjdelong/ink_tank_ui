require 'rails_helper'

RSpec.describe "As a user" do
   describe "when i visit the styles index page" do
      it "i can see all styles and descriptions" do
         @style_1 = create(:style)
         @style_2 = create(:style, name: "Traditional")
         @style_3 = create(:style, name: "Tribal")
    
         visit "/"
         click_link "Styles"
         expect(current_path).to eq("/styles")

         expect(page).to have_content("Black and White")
         expect(page).to have_content("Traditional")
         expect(page).to have_content("Tribal")
         
         expect(page).to have_content(@style_1.description)
         expect(page).to have_content(@style_2.description)
         expect(page).to have_content(@style_3.description)

         expect(page).to have_css(".style", count: 3)
      end
   end
end