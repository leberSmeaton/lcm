FactoryBot.define do
  factory :product do
    user { nil }
    category { nil }
    product_name { "MyString" }
    product_description { "MyText" }
    product_price { 1 }
    product_stock { false }
  end
end
