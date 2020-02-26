require 'rails_helper'

def stub_omniauth
   OmniAuth.config.test_mode = true
   OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
     provider: "google",
      uid: "12345678910",
      info: {
        email: "example@example.com",
        first_name: "first",
        last_name: "last"
      },
      credentials: {
        token: "abcdefg12345",
        refresh_token: "12345abcdefg",
        expires_at: DateTime.now,
      }
      })
end

RSpec.describe 'Registration' do
  it 'user can register' do
    traditional_style = Style.create(
     name: "Traditional",
     description: "The traditional style!" )

    realism_style = Style.create(
     name: "Realism",
     description: "Though classic realism has been a part..." )

    watercolor_style = Style.create(
     name: "Watercolor",
     description: "The watercolor style is currently in vogue." )

    stub_omniauth
    visit root_path
    click_on("Login with Google")

    expect(current_path).to eq(new_shop_path)
    expect(page).to have_content('Enter Shop Information')

    fill_in :_shops_zip_code, with: '80202'
    expect(page).to_not have_field(:streetAddress)
    expect(page).to_not have_field(:city)
    expect(page).to_not have_field(:phone)

    click_on('Search For Shops')
    expect(page).to have_content('No shops found in that zipcode. Please create one.')

    fill_in :shop_name, with: 'default'
    fill_in :shop_street_address, with: '123 Main Street'
    fill_in :shop_city, with: 'Denver'
    fill_in :shop_phone_number, with: '123456789'

    click_on('Next')

    fill_in :artist_name, with: 'John'
    fill_in :artist_price_per_hour, with: 100.00
    fill_in :artist_bio, with: 'I love tattoos!'

    Style.all.each do |style|
      within "#style-#{style.name}" do
        check "style_ids[]"
      end
    end

    click_on('Finish creating profile')

    expect(page).to have_content('Name: John')
    expect(page).to have_content('Hourly rate: $100.00')
    expect(page).to have_content('Bio: I love tattoos!')

    expect(current_path).to eq('/profile')
    expect(page).to have_content('Registration complete!')
  end

  it 'is redirected to show page if already registered' do
    artist = Artist.create(uid: '12345678910', token: 'abcdefg12345', login: 'example@example.com')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(artist)

    stub_omniauth
    visit root_path
    click_on("Login with Google")

    expect(current_path).to eq(profile_path)
  end
end
