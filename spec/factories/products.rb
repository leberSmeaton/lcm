FactoryBot.define do
  factory :product do
    user { nil }
    category { nil }
    product_name { "Comedy Central Triva" }
    product_description { "Top Comedians host trivia rounds" }
    product_price { 1 }
    product_stock { false }
  end
end
