
50.times do
 user = User.create({
   first_name: Faker::Name.first_name,
   last_name: Faker::Name.last_name,
   age: Faker::Number.between(18, 85)
   })

 address = Address.create({
   user_id: user.id,
   street_name: Faker::Address.street_address,
   city: Faker::Address.city,
   state: Faker::Address.state_abbr,
   zip: Faker::Address.zip
   })
end

50.times do
  item = Item.create({
    name:  Faker::Commerce.product_name,
    price: Faker::Number.between(10, 210),
    description: Faker::Lorem.word
    })
end

35.times do
  order = Order.create({
    item_id: Faker::Number.between(1, 50),
    user_id: Faker::Number.between(1, 50),
    quantity: Faker::Number.between(1, 10)
    })
end
