FactoryBot.define do
  factory :address do
    user { nil }
    address_street { "Chomley Street" }
    address_state { "VIC" }
    address_country { "Australia" }
    address_postcode { "3181" }
  end
end
