require 'rails_helper'

RSpec.describe "As a registered user" do
    describe "i can visit the dashboard" do
        it "and see my info as well as a link to view my appointments" do
            OmniAuth.config.test_mode = true

            artist = create(:artist, uid: "12345678910", token: 'token', login: 'example@example.com')
        
            OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
              :provider => 'github',
              :credentials => {:token => ENV['GITHUB_TOKEN']}
              })
        
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(artist)
            
            visit '/artist/dashboard'
            
            expect(page).to have_content("Artist Dashboard")
            expect(page).to have_content(artist.bio)
            expect(page).to have_content(artist.price_per_hour)

            click_link("Appointments")
            expect(current_path).to eq("/artist/appointments")
        end

        it "and take credit card payments" do
            OmniAuth.config.test_mode = true

            artist = create(:artist, uid: "12345678910", token: 'token', login: 'example@example.com')
        
            OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
              :provider => 'github',
              :credentials => {:token => ENV['GITHUB_TOKEN']}
              })
        
            allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(artist)
            
            visit '/artist/dashboard'
            
            fill_in "amount", with: 200
            click_button "Get Paid"
            expect(current_path).to eq("/payments/new")
        end
    end 
end