require 'rails_helper'

RSpec.describe 'Registration' do
  it 'user can register' do
    visit new_shop_path
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
    
    fill_in :user_name, with: 'John'
    fill_in :user_tattoo_styles, with: 'traditional'
    fill_in :user_price_per_hour, with: 100.00
    fill_in :user_bio, with: 'I love tattoos!'

    click_on('Finish creating profile')

    expect(page).to have_content('Name: John')
    expect(page).to have_content('Tattoo styles: traditional')
    expect(page).to have_content('Price per hour: $100.00')
    expect(page).to have_content('Bio: I love tattoos!')

    expect(current_path).to eq('/profile')
    expect(page).to have_content('Registation complete!')
  end

  xit 'is redirected to show page if already registered' do
    shop = Shop.create(name: 'Default shop', street_address: '123 Main', city: 'Denver', zip: '80206', phone_number: '123456789')
    user = User.create(shop_id: shop.id, uid: '123456789', token: '1234abc', login: 'example@gmail.com')

    visit ('/auth/:provider/callback')
    click_on("Log in to GitHub")
    expect(current_path).to eq(users_path(user))
  end
end
