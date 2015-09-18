




50.times do
 user = User.create({
   first_name: Faker::Name.first_name,
   last_name: Faker::Name.last_name,
   age: Faker::Number.between(18, 85)
   })
 Address.create({
   user_id: user.id,
   street: Faker::Address.street_address,
   city: Faker::Address.city,
   state: Faker::Address.state_abbr,
   zip: Faker::Address.zip
   })
end




50.times do
  items = Item.create({
    name:  Faker::
    price: Faker::Number.between(10, 210)
    description: Faker::
    })
end



25.times do
  orders = Orders.create({
    item_id: Faker::Number.between(1, 50)
    user_id: Faker::Number.between(1, 50)
    quantity: Faker::Number.between(1, 10)
    })
end
