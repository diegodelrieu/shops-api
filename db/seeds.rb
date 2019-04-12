# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Shop.destroy_all
Order.destroy_all
Customer.destroy_all


Shop.create!(latitude: "25.546852", longitude: "127.083087", phone_number: "#{Faker::PhoneNumber.cell_phone}", email: "ddog1@gmail.com", password: "fuckyou", name: "#{Faker::Commerce.color} #{Faker::Food.spice.split.first}".titlecase, address: "#{Faker::Address.community}", description: "#{Faker::Company.buzzword} #{Faker::Food.ingredient}".capitalize, opening_hours: "20:30-22:30" , avatar_url: "http://askwomenonline.org/wp-content/uploads/2017/12/hummus-recipe-760x428.jpg")
Shop.create!(latitude: "24.545673", longitude: "128.091434", phone_number: "#{Faker::PhoneNumber.cell_phone}",  email: "ddog2@gmail.com", password: "fuckyou", name: "#{Faker::Commerce.color} #{Faker::Food.spice.split.first}".titlecase, address: "#{Faker::Address.community}", description: "#{Faker::Company.buzzword} #{Faker::Food.ingredient}".capitalize, opening_hours: "20:30-22:30" , avatar_url: "https://img.grouponcdn.com/deal/8DDtq5XRzVnLXEUnPHPd/p2-2048x1229/v1/c700x420.jpg")
Shop.create!(latitude: "26.538152", longitude: "126.091570", phone_number: "#{Faker::PhoneNumber.cell_phone}",  email: "ddog3@gmail.com", password: "fuckyou", name: "#{Faker::Commerce.color} #{Faker::Food.spice.split.first}".titlecase, address: "#{Faker::Address.community}", description: "#{Faker::Company.buzzword} #{Faker::Food.ingredient}".capitalize, opening_hours: "20:30-22:30" , avatar_url: "https://assets.epicurious.com/photos/57a384e73a12dd9d5602415e/2:1/w_1260%2Ch_630/mango-salad.jpg")
Shop.create!(latitude: "25.551463", longitude: "127.091391", phone_number: "#{Faker::PhoneNumber.cell_phone}", email: "ddog4@gmail.com", password: "fuckyou", name: "#{Faker::Commerce.color} #{Faker::Food.spice.split.first}".titlecase, address: "#{Faker::Address.community}", description: "#{Faker::Company.buzzword} #{Faker::Food.ingredient}".capitalize, opening_hours: "20:30-22:30" , avatar_url: "https://media-cdn.tripadvisor.com/media/photo-s/11/76/1c/72/stock-burger-co.jpg")


Shop.all.each do |shop|
  Item.create!(shop: shop, description: "#{Faker::Food.description}", name: "#{Faker::Food.dish}", image_url: "https://loremflickr.com/240/240/food", original_price: "10")
  Item.create!(shop: shop, description: "#{Faker::Food.description}", name: "#{Faker::Food.dish}", image_url: "https://loremflickr.com/240/240/food", original_price: "7")
  Item.create!(shop: shop, description: "#{Faker::Food.description}", name: "#{Faker::Food.dish}", image_url: "https://loremflickr.com/240/240/food", original_price: "13")
end

Customer.create!(name: 'Bob', wechat_id:'bbb', email:'bob@gmail.com', password:'secret')

Order.create!(customer_id: 1, item_id: 1, booked: false)
Order.create!(customer_id: 1, item_id: 2, booked: false)
Order.create!(customer_id: 1, item_id: 3, booked: false)


