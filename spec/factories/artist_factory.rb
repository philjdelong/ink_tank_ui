FactoryBot.define do
  factory :artist do
    name { "Stabby Lambda" }
    price_per_hour { 150.00 }
    bio { 'Tattooer. Stayed at a Holiday Inn Express once.' }
    uid { '11111' }
    login { 'example@mail.com' }
    token { 'token' }
  end
end
