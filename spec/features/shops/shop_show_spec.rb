require 'rails_helper'

RSpec.describe 'As a user' do
    describe 'when i visit shops index' do
        before :each do
            @phils = create(:shop)
            @sams = create(:shop, name: "Sam's", street_address: "321 Address")
            @phil = create(:artist, name: "Phil", shop_id: @phils.id)
            @courtney = create(:artist, name: "Courtney", shop_id: @phils.id)
            @sam = create(:artist, shop_id: @sams.id)
        end
        
        it 'i see all shops and a link to visit each shop show' do
            visit '/shops'

            click_link "Phil's Shop"
            expect(current_path).to eq("/shops/#{@phils.id}")

            expect(page).to have_content(@phils.name, @phils.street_address)

            expect(page).to have_css('.artists')
            expect(page).to have_link(@phil.name)
            expect(page).to have_link(@courtney.name)
            expect(page).to_not have_link(@sam.name)

            click_link(@courtney.name)
            expect(current_path).to eq("/artists/#{@courtney.id}")
        end
    end
end