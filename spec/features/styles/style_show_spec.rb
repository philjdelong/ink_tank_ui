require 'rails_helper'

RSpec.describe "As a user" do
   describe "when i visit the styles index page" do
      before :each do 
         @style_1 = create(:style)
         @style_2 = create(:style, name: "Traditional")
         @style_3 = create(:style, name: "Tribal")
         @style_4 = create(:style, name: "Realism")

         @artist_1 = create(:user, name: "Phil")
         @artist_2 = create(:user, name: "Lain")
         @artist_3 = create(:user, name: "Wren")
         @artist_4 = create(:user, name: "Darren")

         @artist_style_1 = create(:artist_style, user_id: @artist_1.id, style_id: @style_1.id)
         @artist_style_2 = create(:artist_style, user_id: @artist_1.id, style_id: @style_2.id)
         @artist_style_3 = create(:artist_style, user_id: @artist_1.id, style_id: @style_3.id)
         @artist_style_4 = create(:artist_style, user_id: @artist_2.id, style_id: @style_1.id)
         @artist_style_5 = create(:artist_style, user_id: @artist_3.id, style_id: @style_1.id)

         visit "/styles"
      end

      it "i can click on a style to view the show page" do

         click_link "Black and White"
         expect(current_path).to eq("/styles/#{@style_1.id}")

         expect(page).to have_content("Black and White")
         expect(page).to have_content(@style_1.description)
         
         expect(page).to have_content("Artists who perform this style:")
         expect(page).to have_content(@artist_1.name)
         expect(page).to have_content(@artist_2.name)
         expect(page).to have_content(@artist_3.name)

         expect(page).to have_css(".image", count: 30)
      end
   end
end