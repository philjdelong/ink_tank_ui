ArtistStyle.destroy_all
Artist.destroy_all
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
traditional_style = Style.create(
 name: "Traditional",
 description: "The traditional style, also called old school tattoo style, American traditional tattoo style, classic tattoo style or Western traditional tattoo style, is known for its bold lines, bright colors, and iconic designs like roses, anchors, and gorgeous lady heads. With heavy hitters in the history of Traditional like Sailor Jerry, Don Ed Hardy, Bert Grimm, and Lyle Tuttle, this style of tattooing is one of the most well-known and beloved aesthetics within the tattoo community. They're gorgeous from the get go, age beautifully, and are filled with the history of tattooing. You can't really go wrong with a piece in this genre!" )

realism_style = Style.create(
 name: "Realism",
 description: "Though classic realism has been a part of the fine art since as far back as the Renaissance, it only found its way to the world of tattoos recently, cropping up around the latter half of the 20th century. Since then, this new tattoo style has become increasingly refined and extremely popular. As it now stands, you can find jaw-dropping color and black and grey portraits of pretty much any celebrity you can think of as well as realistic depictions of nature and just about anything else imaginable, even the surreal." )

watercolor_style = Style.create(
 name: "Watercolor",
 description: "The watercolor style is currently in vogue. It's in extremely high demand by the most recent generation of tattoo enthusiasts, who seem to be looking for modern tattoo types to match the new millennium. It looks like what it sounds like, as if rendered with a brush dabbled in watery pastels. However, looks can be deceiving, while it's easy to create this aesthetic when working with actual watercolors on paper or canvas, doing it with ink on the human body is no simple feat. Still, artists make all sorts of whimsical and poetic pieces using this innovative approach to tattooing." )

tribal_style = Style.create(
  name: "Tribal",
  description: "Tribal tattoos — i.e. indigenous body art — are the oldest in the world, dating back thousands of years. This style should actually be thought of as multiple styles or more so different traditions of tattooing from aboriginal communities all around the globe. These diverse and beautiful styles are frequently referred to under the umbrella term 'tribal,' but to the trained eye, Polynesian body art is distinctive from Marquesan or Maori tattoos, just like tattoos on Inupiaq matriarchs' faces are different from those found on Berber women. Though these styles are all unique, they are somewhat similar— almost always done in black with elaborate patterns." )

new_school_style = Style.create(
  name: "New School",
  description: "Don't let the name fool you, new school isn't really all that new anymore. It rose to prominence in the weirdness that was the late '80s and early '90s, but lately it has waned in popularity. This is probably because it was very much a product of its time, featuring a highly animated aesthetic that takes after popular entertainment from that period in American history. The style is cartoonish and wacky, featuring caricatures and other exaggerated figures. If you're the sort of person who likes their body art injected with the spirit of Ren and Stimpy, then this comic style is for you."
)

new_traditional_style = Style.create(
  name: "New Traditional",
  description: "Neo traditional, as the name implies, is an evolution of the traditional style. It features the core properties of its predecessor, like pronounced linework and extremely vibrant colors but it also has an illustrative quality to it. This is because Neo traditional artists are highly influenced by Art Nouveau and Art Deco aesthetics. The main difference between traditional tattoos and neo traditional tattoos is that neo traditional tattoos often have a broader color palette and a broader range of motifs. Pieces done in this style are known for their lush, decorative details as well as the use of natural imagery such as florals and animals."
)

japanese_style = Style.create(
  name: "Japanese",
  description: "The traditional Japanese style, aka Irezumi, originated during the Edo period (1603-1868) alongside ukiyo-e — woodblock prints that were hugely popular among the merchant class at the time. Because of this, the icons found in this time-tested genre of body art come from the country's age-old folklore, featuring tattooed heroes from the Suikoden and mythological creatures like dragons, kirins, and phoenixes. In short, every tattoo done in this style tells a story about Japans rich past, and beyond their dramatic smoke and wave filled appearance, this is what makes Irezumi masterpieces so powerful."
)

blackwork_style = Style.create(
  name: "Blackwork",
  description: "Stylistically speaking, blackwork is a very broad categorical term. It applies almost any body art that's created using solely black ink, but as you can imagine, a lot can be done with this versatile and striking color. Looking through blackwork artists portfolios, you'll see all kinds of tattoo types from ancient sacred geometry to modern abstract ornamental designs to extremely detailed illustrative pieces. It is hands down the style where the most experimentation is currently occurring in the industry, and some of the work being produced today is absolutely mind-blowing."
)

illustrative_style = Style.create(
  name: "Illustrative",
  description: "A large variety of work can be called Illustrative, and that is because there are so many techniques and art movements that inspired it! From etching and engraving, to abstract expressionism, and even fine line calligraphy, this tattoo style is extremely versatile. Many artists who work in this style will blend their own aesthetic with it to create a whole new style of their own...but as long as their tattoos look like they could belong on a piece of paper or a canvas hanging up in gallery, you know it's Illustrative!"
)

chicano_style = Style.create(
  name: "Chicano",
  description: "The Chicano style has so much cultural influence that it has gone on to influence other styles as well. Steeped in the history of things such as the Mexican Revolution, Los Angeles low-riders and Pachuco culture. Born behind bars, the aesthetic evolved from artists in prison who used what few materials they had to beautifully capture what they loved and missed on the outside. Usually fine line, black and grey, and wrapped up in the Chicano culture, this genre of tattooing is absolutely enthralling."
)

# artists
phil = Artist.create(
   name: 'Phil',
   price_per_hour: 10.0,
   bio: 'I love tattoo.',
   shop_id: default_shop.id,
   uid: '11111',
   login: 'phil@email.com',
   token: 'token'
)
wren = Artist.create(
   name: 'Wren',
   price_per_hour: 10.0,
   bio: 'I love tattoo.',
   shop_id: default_shop.id,
   uid: '22222',
   login: 'wren@email.com',
   token: 'token'
)
lain = Artist.create(
   name: 'Lain',
   price_per_hour: 10.0,
   bio: 'I love tattoo.',
   shop_id: default_shop.id,
   uid: '33333',
   login: 'lain@email.com',
   token: 'token'
)
darren = Artist.create(
   name: "Darren",
   price_per_hour: 10.0,
   bio: 'I love tattoo.',
   shop_id: default_shop.id,
   uid: '44444',
   login: 'darren@email.com',
   token: 'token'
)

# artist_styles
artist_style_1 = ArtistStyle.create(
   artist_id: phil.id, 
   style_id: traditional_style.id
)
artist_style_2 = ArtistStyle.create(
   artist_id: phil.id, 
   style_id: realism_style.id
)
artist_style_3 = ArtistStyle.create(
   artist_id: phil.id, 
   style_id: watercolor_style.id
)
artist_style_4 = ArtistStyle.create(
   artist_id: wren.id, 
   style_id: traditional_style.id
)
artist_style_5 = ArtistStyle.create(
   artist_id: lain.id, 
   style_id: traditional_style.id
)
artist_style_6 = ArtistStyle.create(
   artist_id: darren.id, 
   style_id: traditional_style.id
)
