require 'rails_helper'


RSpec.describe User, type: :model do
  describe 'validations' do
    it { should belong_to(:shop) }
    # it { should validate_presence_of(:name)}
    # it { should validate_presence_of(:tattoo_styles)}
    # it { should validate_presence_of(:price_per_hour)}
    # it { should validate_presence_of(:bio)}
  end

  it "can update_user" do
    user_info = {uid: '123456789', credentials: {token: '1234abc'}, extra: {raw_info: {login: 'example@gmail.com'}}}
    user = User.create(name: 'Harry Potter')
    expect(user.uid).to eq(nil)
    expect(user.token).to eq(nil)
    expect(user.login).to eq(nil)

    user.update_user(user_info, user)
    expect(user.uid).to eq('123456789')
    expect(user.token).to eq('1234abc')
    expect(user.login).to eq('example@gmail.com')
  end

  it "can create user with partial params" do
    shop = Shop.create(name: 'Default shop', street_address: '123 Main', city: 'Denver', zip: '80206', phone_number: '123456789')
    user_info = {uid: '123456789', credentials: {token: '1234abc'}, extra: {raw_info: {login: 'example@gmail.com'}}}
    User.create_user(user_info)

    user = User.last

    expect(user.shop_id).to eq(shop.id)
    expect(user.uid).to eq('123456789')
    expect(user.token).to eq('1234abc')
    expect(user.login).to eq('example@gmail.com')
  end

  it "can update the user's shop" do
    shop = Shop.create(name: 'Default shop', street_address: '123 Main', city: 'Denver', zip: '80206', phone_number: '123456789')
    shop_1 = Shop.create(name: 'Shop 2', street_address: '123 Main', city: 'Denver', zip: '80206', phone_number: '123456789')
    user_info = {uid: '123456789', credentials: {token: '1234abc'}, extra: {raw_info: {login: 'example@gmail.com'}}}
    user = User.create_user(user_info)

    expect(user.shop_id).each { |e|  }to eq(shop.id)
    user.update_user_shop(user, shop_1.id)

    expect(user.shop_id).to eq(shop_1.id)
  end
end
