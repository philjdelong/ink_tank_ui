require 'rails_helper'

RSpec.describe Artist, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:uid).on(:create) }
    it { should validate_presence_of(:login).on(:create) }
    it { should validate_presence_of(:token).on(:create) }
    it { should validate_presence_of(:name).on(:update) }
    it { should validate_presence_of(:price_per_hour).on(:update) }
    it { should validate_presence_of(:bio).on(:update) }
  end

  describe 'relationships' do
    it { should have_many(:artist_styles) }
    it { should have_many(:artists).through(:artist_styles) }
  end

  it "can update_user" do
    user_info = {uid: '123456789', credentials: {token: '1234abc'}, info: {email: 'example@gmail.com'}}
    artist =  Artist.create(name: 'Harry Potter')
    expect(artist.uid).to eq(nil)
    expect(artist.token).to eq(nil)
    expect(artist.login).to eq(nil)

    Artist.update_user(user_info, artist)

    expect(artist.uid).to eq('123456789')
    expect(artist.token).to eq('1234abc')
    expect(artist.login).to eq('example@gmail.com')
  end

  it "can create user with partial params" do
    shop = Shop.create(name: 'Default shop', street_address: '123 Main', city: 'Denver', zip: '80206', phone_number: '123456789')
    user_info = {uid: '123456789', credentials: {token: '1234abc'}, info: {email: 'example@gmail.com'}}
    Artist.save_user_oauth_info(user_info)

    artist =  Artist.last

    expect(artist.uid).to eq('123456789')
    expect(artist.token).to eq('1234abc')
    expect(artist.login).to eq('example@gmail.com')
  end

  it "can update the user's shop" do
    shop = Shop.create(name: 'Default shop', street_address: '123 Main', city: 'Denver', zip: '80206', phone_number: '123456789')
    shop_1 = Shop.create(name: 'Shop 2', street_address: '123 Main', city: 'Denver', zip: '80206', phone_number: '123456789')
    user_info = {uid: '123456789', credentials: {token: '1234abc'}, info: {email: 'example@gmail.com'}}
    artist =  Artist.save_user_oauth_info(user_info)

    artist.update_user_shop(artist, shop_1.id)

    expect(artist.shop_id).to eq(shop_1.id)
  end

  it "can fill out the remaining user fields" do
    shop = Shop.create(name: 'Default shop', street_address: '123 Main', city: 'Denver', zip: '80206', phone_number: '123456789')
    traditional_style = Style.create(id: 1, name: "Traditional", description: "The traditional style!" )
    artist =  Artist.create(shop_id: shop.id, uid: '123456789', token: '1234abc', login: 'example@gmail.com')
    style = ArtistStyle.create(id: 1, artist_id: artist.id, style_id: traditional_style.id)
    params = { artist: {name: 'Harry Potter', price_per_hour: '100', bio: 'No dark marks'}, style_ids: [style.id]}


    expect(artist.name).to eq(nil)
    expect(artist.price_per_hour).to eq(nil)
    expect(artist.bio).to eq(nil)

    artist.complete_user(artist, params)

    expect(artist.name).to eq('Harry Potter')
    expect(artist.price_per_hour).to eq(100.00)
    expect(artist.bio).to eq('No dark marks')

  end
end
