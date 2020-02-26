Style.destroy_all
default_shop = Shop.create!(name: 'Default shop', street_address: '123 Main', city: 'Denver', zip: '80206', phone_number: '123456789')

@style_1 = Style.create(
   name: "Black and White",
   description: "Super cool stuff right here"
)
@style_2 = Style.create(
   name: "Traditional",
   description: "Super traditional stuff, Yep."
)
@style_3 = Style.create(
   name: "Tribal",
   description: "Arm band."
)
