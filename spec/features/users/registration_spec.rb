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

    fill_in :_shops_street_address, with: '123 Main Street'
    fill_in :_shops_city, with: 'Denver'
    fill_in :_shops_phone_number, with: '123456789'

    click_on('Next')

    fill_in :name, with: 'John'
    fill_in :tattoo_styles, with: 'traditional'
    fill_in :price_per_hour, with: 100.00
    fill_in :bio, with: 'I love tattoos!'

    click_on('Finish creating profile')

    expect(page).to have_content('Name: John')
    expect(page).to have_content('Tattoo styles: traditional')
    expect(page).to have_content('Price per hour: $100.00')
    expect(page).to have_content('Bio: I love tattoos!')

    expect(current_path).to eq('/profile')
    expect(page).to have_content('Registation complete!')
  end
end
