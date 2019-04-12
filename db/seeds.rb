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
number = [0, 1, 2, 3, 4, 5]


Shop.create!(rating: number.sample, latitude: "22.54381663260095", longitude: "114.06543139669014", phone_number: "#{Faker::PhoneNumber.cell_phone}", email: "ddog1@gmail.com", password: "fuckyou", name: "#{Faker::Commerce.color} #{Faker::Food.spice.split.first}".titlecase, address: "#{Faker::Address.community}", description: "#{Faker::Company.buzzword} #{Faker::Food.ingredient}".capitalize, opening_hours: "20:30-22:30" , avatar_url: "https://source.unsplash.com/500x500/?restaurant")
Shop.create!(rating: number.sample, latitude: "22.54841255282532", longitude: "114.08102175077926", phone_number: "#{Faker::PhoneNumber.cell_phone}",  email: "ddog2@gmail.com", password: "fuckyou", name: "#{Faker::Commerce.color} #{Faker::Food.spice.split.first}".titlecase, address: "#{Faker::Address.community}", description: "#{Faker::Company.buzzword} #{Faker::Food.ingredient}".capitalize, opening_hours: "20:30-22:30" , avatar_url: "https://source.unsplash.com/500x500/?bakery")
Shop.create!(rating: number.sample, latitude: "22.542272022982946", longitude: "114.07778804712878", phone_number: "#{Faker::PhoneNumber.cell_phone}",  email: "ddog3@gmail.com", password: "fuckyou", name: "#{Faker::Commerce.color} #{Faker::Food.spice.split.first}".titlecase, address: "#{Faker::Address.community}", description: "#{Faker::Company.buzzword} #{Faker::Food.ingredient}".capitalize, opening_hours: "20:30-22:30" , avatar_url: "https://source.unsplash.com/500x500/?fruits")
Shop.create!(rating: number.sample, latitude: "22.538401663890813", longitude: "114.07484266137851", phone_number: "#{Faker::PhoneNumber.cell_phone}", email: "ddog4@gmail.com", password: "fuckyou", name: "#{Faker::Commerce.color} #{Faker::Food.spice.split.first}".titlecase, address: "#{Faker::Address.community}", description: "#{Faker::Company.buzzword} #{Faker::Food.ingredient}".capitalize, opening_hours: "20:30-22:30" , avatar_url: "https://source.unsplash.com/500x500/?food")


Shop.all.each do |shop|
  Item.create!(shop: shop, description: "#{Faker::Food.ingredient}, #{Faker::Food.fruits}, #{Faker::Food.vegetables}", name: "#{Faker::Food.dish}", image_url: "https://source.unsplash.com/400x400/?dessert", original_price: number.sample * 3, discount_price: :original_price * 0.75)
  Item.create!(shop: shop, description: "#{Faker::Food.ingredient}, #{Faker::Food.fruits}, #{Faker::Food.vegetables}", name: "#{Faker::Food.dish}", image_url: "https://source.unsplash.com/400x400/?bread", original_price: number.sample * 3, discount_price: :original_price * 0.75)
  Item.create!(shop: shop, description: "#{Faker::Food.ingredient}, #{Faker::Food.fruits}, #{Faker::Food.vegetables}", name: "#{Faker::Food.dish}", image_url: "https://source.unsplash.com/400x400/?drink", original_price: number.sample * 3, discount_price: :original_price * 0.75)
end

Customer.create!(name: 'Bob', wechat_id:'bbb', email:'bob@gmail.com', password:'secret')

Order.create!(customer_id: 1, item_id: 1, booked: false)
Order.create!(customer_id: 1, item_id: 2, booked: false)
Order.create!(customer_id: 1, item_id: 3, booked: false)


