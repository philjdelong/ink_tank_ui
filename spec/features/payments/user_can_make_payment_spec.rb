require 'rails_helper'

RSpec.describe "as an artist" do
  it "can initiate a payment" do
    shop = Shop.create(name: "Ink Link", street_address: "123 Sesame Street", city: "Austin", phone_number: "5124592222", zip: "78620")
    artist = User.new(name: "Sterling Archer", shop: shop)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(artist)

    visit '/'

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
