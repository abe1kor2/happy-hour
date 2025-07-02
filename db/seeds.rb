# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Seeding database..."

# ---- Restaurant 1 Seed Data ----
r1 = Restaurant.find_or_initialize_by(id: "37b604f1-4473-41a8-b928-16e778cd7308")
if r1.new_record?
  puts "Creating St. John's Fish Exchange..."
  r1.assign_attributes(
    name: "St. John's Fish Exchange Kitchen & Wet Bar",
    address: "351 Water St, St. John's, NL A1C 1C2",
    phone: "(709) 739-7539",
    website: "https://sjfx.ca/",
    latitude: 47.56039315016426,
    longitude: -52.71058174891693
  )
  r1.save!
else
  puts "Found St. John's Fish Exchange, skipping creation."
end
r1.photo.attach(io: File.open(Rails.root.join("app/assets/images/fish-exchange-happyhour.jpg")), filename: "fish-exchange-happyhour.jpg") unless r1.photo.attached?
if r1.deals.empty?
  r1.deals.create!(
    day: "Monday",
    start_time: "16:30",
    end_time: "18:30",
    description: "Here’s one part of the weekday you’ll look forward to — Happy Hour. Join us from 4:30–6:30 pm at the bar!"
  )
end

# ---- Restaurant 2 Seed Data ----
r2 = Restaurant.find_or_initialize_by(id: "c5d792f4-bd59-484e-ac07-beeb4287f2fe")
if r2.new_record?
  puts "Creating Bernard Stanley Gastropub..."
  r2.assign_attributes(
    name: "Bernard Stanley Gastropub",
    address: "223 Duckworth St, St. John's, NL A1C 1G7",
    phone: "(709) 722-5266",
    website: "http://www.bernardstanleygastropub.com/",
    latitude: 47.56720553251499,
    longitude: -52.704883664261565
  )
  r2.save!
else
    puts "Found Bernard Stanley Gastropub, skipping creation."
end
r2.photo.attach(io: File.open(Rails.root.join("app/assets/images/bernard-stanley.jpg")), filename: "bernard-stanley.jpg") unless r2.photo.attached?
if r2.deals.empty?
  r2.deals.create!(
    day: "Monday to Friday",
    start_time: "15:00",
    end_time: "18:00",
    description: "Join us for Happy Hour in downtown St. John’s, Monday to Friday from 3:00 to 6:00 pm, great drinks, tasty bites, and good vibes!"
  )
end

# ---- Restaurant 3 Seed Data ----
r3 = Restaurant.find_or_initialize_by(id: "5b703c0d-9300-4d5f-a175-d69a81d50aa4")
if r3.new_record?
    puts "Creating SHAMROCK CITY..."
    r3.assign_attributes(
        name: "SHAMROCK CITY",
        address: "340 Water St, St. John's, NL A1C 5N8",
        phone: "(709) 722-7200",
        website: "http://shamrockcity.ca/",
        latitude: 47.56445989033737,
        longitude: -52.713260541934346
    )
    r3.save!
else
    puts "Found SHAMROCK CITY, skipping creation."
end
r3.photo.attach(io: File.open(Rails.root.join("app/assets/images/shamrock-city.jpg")), filename: "shamrock-city.jpg") unless r3.photo.attached?
if r3.deals.empty?
  r3.deals.create!([
    {
      day: "Monday to Friday",
      start_time: "16:00",
      end_time: "18:00",
      description: "Happy hour daily from 4-6 pm with $6 select Molson pints and $6 munchies!"
    },
    {
      day: "Monday",
      start_time: "20:00",
      end_time: "23:00",
      description: "Muggy Monday"
    }
  ])
end

# ---- Restaurant 4 Seed Data ----
r4 = Restaurant.find_or_initialize_by(id: "192be33d-defa-4f7c-aaa3-42149891f0de")
if r4.new_record?
    puts "Creating Sláinte..."
    r4.assign_attributes(
        name: "Sláinte",
        address: "16 George St, St. John's, NL A1C 1J9",
        phone: "(709) 754-0930",
        website: "https://localpub.com",
        latitude: 47.571392204546584,
        longitude: -52.70390868940153
    )
    r4.save!
else
    puts "Found Sláinte, skipping creation."
end
r4.photo.attach(io: File.open(Rails.root.join("app/assets/images/slainte.jpg")), filename: "slainte.jpg") unless r4.photo.attached?
if r4.deals.empty?
  r4.deals.create!(
    day: "Tuesday through Friday",
    start_time: "14:00",
    end_time: "16:00",
    description: "Happy hour from 4-6 pm Tuesday through Friday $10 cocktails, $9 wine, $8 pints of draught"
  )
end

# ---- Restaurant 5 Seed Data ----
r5 = Restaurant.find_or_initialize_by(id: "b4f5f36e-9220-4403-afad-f00924091e82")
if r5.new_record?
    puts "Creating Landwash Brewery..."
    r5.assign_attributes(
        name: "Landwash Brewery",
        address: "181 Kenmount Rd, St. John's, NL A1B 3P9",
        phone: "(709) 700-1292",
        website: "http://landwashbrewery.com/",
        latitude: 47.508352702906116,
        longitude: -52.794260301030874
    )
    r5.save!
else
    puts "Found Landwash Brewery, skipping creation."
end
r5.photo.attach(io: File.open(Rails.root.join("app/assets/images/landwash-brewery.jpg")), filename: "landwash-brewery.jpg") unless r5.photo.attached?
if r5.deals.empty?
  r5.deals.create!(
    day: "Wednesday, Thursday, and Friday",
    start_time: "12:00",
    end_time: "17:00",
    description: "$7 beers every Wednesday, Thursday, and Friday before 5pm!"
  )
end

# ---- Restaurant 6 Seed Data ----
r6 = Restaurant.find_or_initialize_by(id: "e1f347d6-464c-4269-adb6-23a232b63d90")
if r6.new_record?
    puts "Creating Magnum & Steins..."
    r6.assign_attributes(
        name: "Magnum & Steins",
        address: "329 Duckworth St, St. John's, NL A1C 1H3",
        phone: "(709) 576-6500",
        website: "https://www.magnumandsteins.ca/",
        latitude: 47.564222341563834,
        longitude: -52.70794951637276
    )
    r6.save!
else
    puts "Found Magnum & Steins, skipping creation."
end
r6.photo.attach(io: File.open(Rails.root.join("app/assets/images/magnum-happy-hours-1311x1536.jpg")), filename: "magnum-happy-hours-1311x1536.jpg") unless r6.photo.attached?
if r6.deals.empty?
  r6.deals.create!(
    day: "Tuesday – Saturday 5-7 pm, Sunday & Monday 5-9 pm",
    start_time: "17:00",
    end_time: "19:00",
    description: "Happy Hour Tuesday – Saturday 5-7 pm, Sunday & Monday 5-9 pm. Plus check out their Happy Hour bites menu"
  )
end

# ---- Restaurant 7 Seed Data ----
r7 = Restaurant.find_or_initialize_by(id: "b6d17485-f74a-4883-a60e-325c047fa8da")
if r7.new_record?
    puts "Creating The Cannery..."
    r7.assign_attributes(
        name: "The Cannery",
        address: "369 Harbour Dr, St. John's, NL A1C 1B7",
        phone: "(709) 754-9901",
        website: "https://www.cannerysocial.com/",
        latitude: 47.55712153488684,
        longitude: -52.715046391244684
    )
    r7.save!
else
    puts "Found The Cannery, skipping creation."
end
r7.photo.attach(io: File.open(Rails.root.join("app/assets/images/carney.jpg")), filename: "carney.jpg") unless r7.photo.attached?
if r7.deals.empty?
  r7.deals.create!(
    day: "Everyday",
    start_time: "17:00",
    end_time: "18:00",
    description: "Unwind the right way. Enjoy Happy Hour specials that hit all the right notes—great bites, cold drinks, and better company."
  )
end

# ---- Restaurant 8 Seed Data ----
r8 = Restaurant.find_or_initialize_by(id: "03fee3ac-6627-4ace-8fd3-38ea17a5e350")
if r8.new_record?
    puts "Creating The Gypsy Tea Room..."
    r8.assign_attributes(
        name: "The Gypsy Tea Room",
        address: "315 Water St, St. John's, NL A1C 1B9",
        phone: "(709) 739-4979",
        website: "http://www.gypsytearoom.ca/",
        latitude: 47.561876098739816,
        longitude: -52.70986712986412
    )
    r8.save!
else
    puts "Found The Gypsy Tea Room, skipping creation."
end
r8.photo.attach(io: File.open(Rails.root.join("app/assets/images/gypsy_tea_room.jpeg")), filename: "gypsy_tea_room.jpeg") unless r8.photo.attached?
if r8.deals.empty?
  r8.deals.create!(
    day: "Everyday",
    start_time: "15:30",
    end_time: "17:00",
    description: "Happy Hour at The Gypsy Tea Room. Join us Monday to Friday from 3:30 to 5:00 pm for Happy Hour in the heart of downtown St. John’s."
  )
end

# ---- Restaurant 9 Seed Data ----
r9 = Restaurant.find_or_initialize_by(id: "b6aa58d9-4688-4c95-9f4f-6c5b56b10334")
if r9.new_record?
    puts "Creating Celtic Hearth..."
    r9.assign_attributes(
        name: "Celtic Hearth",
        address: "300 Water St, St. John's, NL A1C 1B8",
        phone: "(709) 576-2934",
        website: "https://www.facebook.com/TheCelticHearth/",
        latitude: 47.562088667103716,
        longitude: -52.7099802452091
    )
    r9.save!
else
    puts "Found Celtic Hearth, skipping creation."
end
r9.photo.attach(io: File.open(Rails.root.join("app/assets/images/celtic-hearth-happy-hour.jpg")), filename: "celtic-hearth-happy-hour.jpg") unless r9.photo.attached?
if r9.deals.empty?
  r9.deals.create!(
    day: "Everyday",
    start_time: "16:00",
    end_time: "19:00",
    description: "Make Time for Happy Hour! 4–7pm & 11pm–1am"
  )
end

# ---- Restaurant 10 Seed Data ----
r10 = Restaurant.find_or_initialize_by(id: "14ec631c-9284-496c-b742-7a7de6334724")
if r10.new_record?
    puts "Creating RABBLE..."
    r10.assign_attributes(
        name: "RABBLE",
        address: "335 Duckworth St, St. John's, NL A1C 1G9",
        phone: "(709) 722-1981",
        website: "https://www.tbdine.com/book/restaurant/rabble-restaurant",
        latitude: 47.56400142103097,
        longitude: -52.70722992193435
    )
    r10.save!
else
    puts "Found RABBLE, skipping creation."
end
r10.photo.attach(io: File.open(Rails.root.join("app/assets/images/rabble.jpg")), filename: "rabble.jpg") unless r10.photo.attached?
if r10.deals.empty?
  r10.deals.create!(
    day: "Everyday",
    start_time: "14:00",
    end_time: "16:00",
    description: "Mimosa Mondays $6.00, Tinto Tuesdays $8.00, Wine Wednesdays $8.00, Thirsty Thursdays $8.00, Frosty Fridays $5.00, Spritz Saturdays $8.00, Caesar Sundays $6.00"
  )
end

puts "Finished seeding database."
