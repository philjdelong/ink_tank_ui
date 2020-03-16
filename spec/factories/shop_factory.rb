FactoryBot.define do
    factory :shop do
      name { "Phil's Shop" }
      street_address { "123 Address" }
      city { "Denver" }
      zip { "80202" }
      phone_number { "123-456-7890" }
    end
  end