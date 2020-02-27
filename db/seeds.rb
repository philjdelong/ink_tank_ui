ArtistStyle.destroy_all
User.destroy_all
Style.destroy_all
Shop.destroy_all

# shops
default_shop = Shop.create!(
   name: 'Default shop', 
   street_address: '123 Main', 
   city: 'Denver', zip: '80206', 
   phone_number: '123456789'
)

# styles
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

# artists
@artist_1 = User.create(
   name: 'Phil',
   price_per_hour: 10.0,
   bio: 'I love tattoo.',
   shop_id: default_shop.id,
   uid: '11111',
   login: 'phil@email.com',
   token: 'token'
)
@artist_2 = User.create(
   name: 'Wren',
   price_per_hour: 10.0,
   bio: 'I love tattoo.',
   shop_id: default_shop.id,
   uid: '22222',
   login: 'wren@email.com',
   token: 'token'
)
@artist_3 = User.create(
   name: 'Lain',
   price_per_hour: 10.0,
   bio: 'I love tattoo.',
   shop_id: default_shop.id,
   uid: '33333',
   login: 'lain@email.com',
   token: 'token'
)
@artist_4 = User.create(
   name: "Darren",
   price_per_hour: 10.0,
   bio: 'I love tattoo.',
   shop_id: default_shop.id,
   uid: '44444',
   login: 'darren@email.com',
   token: 'token'
)

# artist_styles
@artist_style_1 = ArtistStyle.create(
   user_id: @artist_1.id, 
   style_id: @style_1.id
)
@artist_style_2 = ArtistStyle.create(
   user_id: @artist_1.id, 
   style_id: @style_2.id
)
@artist_style_3 = ArtistStyle.create(
   user_id: @artist_1.id, 
   style_id: @style_3.id
)
@artist_style_4 = ArtistStyle.create(
   user_id: @artist_2.id, 
   style_id: @style_1.id
)
@artist_style_5 = ArtistStyle.create(
   user_id: @artist_3.id, 
   style_id: @style_1.id
)
