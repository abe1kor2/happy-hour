# # This file should ensure the existence of records required to run the application in every environment (production,
# # development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #

# ---- Restaurant 1 Seed Data ----
r1 = Restaurant.create!(
  name: "St. John's Fish Exchange Kitchen & Wet Bar",
  address: "123 Main St",
  phone: "555-1234",
  website: "https://sjfx.ca/",
  latitude: 47.56039315016426,
  longitude: -52.71058174891693
)

r1.deals.create!(
  day: "Monday",
  start_time: "16:30",
  end_time: "18:30",
  description: "Here’s one part of the weekday you’ll look forward to — Happy Hour.
  Join us from 4:30–6:30 pm at the bar!"
)

# ---- Restaurant 2 Seed Data ----
r2 = Restaurant.create!(
  name: "Bernard Stanley Gastropub",
  address: "123 Main St",
  phone: "555-1234",
  website: "http://www.bernardstanleygastropub.com/",
  latitude: 47.56720553251499,
  longitude: -52.704883664261565
)

r2.deals.create!(
  day: "Monday to Friday",
  start_time: "15:00",
  end_time: "18:00",
  description: "Join us for Happy Hour in downtown St. John’s, Monday to Friday from 3:00 to 6:00 pm, great drinks, tasty bites, and good vibes!"
)

# ---- Restaurant 3 Seed Data ----
r3 = Restaurant.create!(
  name: "SHAMROCK CITY",
  address: "123 Main St",
  phone: "555-1234",
  website: "http://shamrockcity.ca/",
  latitude: 47.56445989033737,
  longitude: -52.713260541934346
)

r3.deals.create!(
  day: "Monday to Friday",
  start_time: "16:00",
  end_time: "18:00",
  description: "Happy hour daily from 4-6 pm with $6 select Molson pints and $6 munchies!"
)

r3.deals.create!(
  day: "Monday",
  start_time: "20:00",
  end_time: "23:00",
  description: "Muggy Monday"
)

# ---- Restaurant 4 Seed Data ----
r4 = Restaurant.create!(
  name: "Sláinte",
  address: "123 Main St",
  phone: "555-1234",
  website: "https://localpub.com",
  latitude: 47.571392204546584,
  longitude: -52.70390868940153
)

r4.deals.create!(
  day: "Tuesday through Friday",
  start_time: "14:00",
  end_time: "16:00",
  description: "Happy hour from 4-6 pm Tuesday through Friday
$10 cocktails, $9 wine, $8 pints of draught"
)

# ---- Restaurant 5 Seed Data ----
r5 = Restaurant.create!(
  name: "Landwash Brewery",
  address: "123 Main St",
  phone: "555-1234",
  website: "http://landwashbrewery.com/",
  latitude: 47.508352702906116,
  longitude: -52.794260301030874
)

r5.deals.create!(
  day: "Wednesday, Thursday, and Friday",
  start_time: "12:00",
  end_time: "17:00",
  description: "$7 beers every Wednesday, Thursday, and Friday before 5pm!"
)

# ---- Restaurant 6 Seed Data ----
r6 = Restaurant.create!(
  name: "Magnum & Steins",
  address: "123 Main St",
  phone: "555-1234",
  website: "https://www.magnumandsteins.ca/uploads/1/6/7/6/16762878/happy_hour_menu_2025_march-tariff.pdf",
  latitude: 47.564222341563834,
  longitude: -52.70794951637276
)

r6.deals.create!(
  day: "Tuesday – Saturday 5-7 pm, Sunday & Monday 5-9 pm",
  start_time: "12:00",
  end_time: "17:00",
  description: "Happy Hour Tuesday – Saturday 5-7 pm, Sunday & Monday 5-9 pm
Plus check out their Happy Hour bites menu"
)

# ---- Restaurant 7 Seed Data ----
r7 = Restaurant.create!(
  name: "The Cannery",
  address: "123 Main St",
  phone: "555-1234",
  website: "https://www.cannerysocial.com/reservations-st-johns",
  latitude: 47.55712153488684,
  longitude: -52.715046391244684
)

r7.deals.create!(
  day: "Everyday",
  start_time: "17:00",
  end_time: "18:00",
  description: "Unwind the right way. Enjoy Happy Hour specials that hit all the right notes—great bites, cold drinks, and better company."
)

# ---- Restaurant 8 Seed Data ----
r8 = Restaurant.create!(
  name: "The Gypsy Tea Room",
  address: "123 Main St",
  phone: "555-1234",
  website: "http://www.gypsytearoom.ca/",
  latitude: 47.561876098739816,
  longitude: -52.70986712986412
)

r8.deals.create!(
  day: "Everyday",
  start_time: "15:30",
  end_time: "17:00",
  description: "Happy Hour at The Gypsy Tea Room
Join us Monday to Friday from 3:30 to 5:00 pm for Happy Hour in the heart of downtown St. John’s. Enjoy great deals on cocktails, wine, draught, and snacks — the perfect way to unwind after the workday. Cheers!"
)

# ---- Restaurant 9 Seed Data ----
r9 = Restaurant.create!(
  name: "Celtic Hearth",
  address: "123 Main St",
  phone: "555-1234",
  website: "https://www.facebook.com/TheCelticHearth/",
  latitude: 47.562088667103716,
  longitude: -52.7099802452091
)

r9.deals.create!(
  day: "Everyday",
  start_time: "16:00",
  end_time: "19:00",
  description: "Make Time for Happy Hour!
  4–7pm & 11pm–1am

  Let’s raise a glass to good friends, great drinks, and the perfect excuse to stay out."
)

# ---- Restaurant 10 Seed Data ----
r10 = Restaurant.create!(
  name: "RABBLE",
  address: "123 Main St",
  phone: "555-1234",
  website: "https://www.tbdine.com/book/restaurant/rabble-restaurant?idApp=71754&language=en-us",
  latitude: 47.56400142103097,
  longitude: -52.70722992193435
)

r10.deals.create!(
  day: "Everyday",
  start_time: "14:00",
  end_time: "16:00",
  description: "Mimosa Mondays $6.00 (Coming Soon!)
  Tinto Tuesdays $8.00 Tinto De Verano
  Wine Wednesdays $8.00 Wine By The Glass
  Thirsty Thursdays $8.00 Feature Cocktails
  Frosty Fridays $5.00 Draught Beers
  Spritz Saturdays $8.00 Spritzes
  Caesar Sundays $6.00 Caesars"
)
