FactoryBot.define do
  factory :address do
    user { nil }
    address_street { "MyString" }
    address_state { "MyString" }
    address_country { "MyString" }
    address_postcode { "MyString" }
  end
end
