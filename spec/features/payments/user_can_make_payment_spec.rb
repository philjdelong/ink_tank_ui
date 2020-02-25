require 'rails_helper'

RSpec.describe "as an artist" do
  it "can initiate a payment" do
    shop = Shop.create(name: 'Default shop', street_address: '123 Main', city: 'Denver', zip: '80206', phone_number: '123456789')
    user = create(:user, shop: shop, uid: '12345', token: 'token', login: 'example@example.com')
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/'
    binding.pry
    click_on "Get Paid"
    expect(current_path).to eq('/payments/new')

    fill_in :name, with: 'Cyril Figgis'
    fill_in :amount, with: '200'
    fill_in :card_number, with: 1234567898765432
    fill_in :card_type, with: 'tok_mastercard'
    click_button 'Submit'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Charge complete')
  end
end
