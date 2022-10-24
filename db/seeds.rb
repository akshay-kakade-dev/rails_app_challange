# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# generate fake data

def generare_fake_user_data
  {
    name: Faker::Name.name,
    contact_no: Faker::PhoneNumber.cell_phone,
    city: Faker::Address.city,
    email: Faker::Internet.email,
    category: ["Premium", "Economical", "Business", "Luxury"].sample
  }
end

# create users
1000.times { User.create(generare_fake_user_data) }




users = User.all

def generare_fake_product_data(user:)
  {
    user: user,
    category: ["ENTMNT", "HOME", "SPORTS", "FASHION"].sample,
    price: Faker::Commerce.price.to_i,
    name: Faker::Commerce.product_name,
    manufacturer: Faker::Company.name
  }
end

10000.times do
  Product.create(generare_fake_product_data(user: users.sample))
end

# users = []

# 5.times do
#   users << {
#     user_id: rand(100),
#     category: ["ENTMNT", "HOME", "SPORTS", "FASHION"].sample,
#     price: Faker::Commerce.price.to_i,
#     name: Faker::Commerce.product_name,
#     manufacturer: Faker::Company.name,
#     created_at: DateTime.now,
#     updated_at: DateTime.now
#   }
# end

