# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = [
    {category_name:"Collage"},
    {category_name:"Dance"},
    {category_name:"Woodwork"},
    {category_name:"Performance"},
    {category_name:"Pottery"},
    {category_name:"Trivia"}
]

if Category.count == 0
    categories.each do |category|
        Category.create(category_name: category[:category_name])
        puts "Created #{category[:category_name]} category"
    end
end

if User.count == 0 
    User.create(username:"Abby Bob", email:"abbybob@test.com", password:"password", password_confirmation:"password")
end