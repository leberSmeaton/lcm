# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# categories = [
#     {category_name:"Collage"},
#     {category_name:"Dance"},
#     {category_name:"Woodwork"},
#     {category_name:"Performance"},
#     {category_name:"Pottery"},
#     {category_name:"Trivia"}
# ]

# if Category.count == 0
#     categories.each do |category|
#         Category.create(category_name: category[:category_name])
#         puts "Created #{category[:category_name]} category"
#     end
# end

if User.count == 0 
    5.times do |i|
        User.create(
            fullname: Faker::Name.name,
            username: Faker::Internet.user_name,
            email: Faker::Internet.email,
            profile_info: Faker::Hipster.sentence
            # password: ,
            # password_confirmation:
        )
        Address.create(
            user_id: i + 1,
            address_street: Faker::Address.street_address,
            address_state: Faker::Address.state,
            address_country: Faker::Address.country,
            address_postcode: Faker::Address.postcode
        )
    end
end

if Product.count == 0 
    10.times do |i|
        Product.new(
            product_name: Faker::Commerce.product_name,
            product_description: Faker::Commerce.department,
            product_price: Faker::Commerce.price,
            # category_id: ??
            product_stock: false
        )
    end
end