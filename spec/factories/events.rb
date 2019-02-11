FactoryBot.define do
  factory :event do
    start_date { DateTime.now + 1 }
    duration { 10 }
    title { Faker::Lorem.characters(rand(5..140)) }
    description { Faker::Lorem.characters(rand(20..1000)) }
    price { rand(1..1000) }
    location { Faker::Address.city }
    admin { FactoryBot.create(:user) }
  end
end
