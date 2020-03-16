require 'rails_helper'

RSpec.describe 'As a user' do
    describe 'when i visit shops index' do
        before :each do
            @phils = create(:shop)
        end
        
        it 'i see all shops and a link to visit each shop show' do
            visit '/'

            click_link 'Shops'
            expect(current_path).to eq('/shops')

            expect(page).to have_css('#shops')

            click_link "Phil's Shop"
            expect(current_path).to eq("/shops/#{@phils.id}")
        end
    end
end