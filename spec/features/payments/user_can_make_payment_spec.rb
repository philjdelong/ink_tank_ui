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

RSpec.describe "as an artist" do
  xit "can initiate a payment" do
    stub_omniauth
    user = create(:artist, uid: "12345678910", token: 'token', login: 'example@example.com')
    visit root_path

    click_on("Login with Google")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit '/profile'
    fill_in :amount, with:222
    click_on "Get Paid"
    expect(current_path).to eq('/payments/new')


  end
end
