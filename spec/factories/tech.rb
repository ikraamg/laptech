FactoryBot.define do
  factory :tech do
    user_id { 2 }
    title { Faker::Lorem.word }
    category { Faker::Lorem.word }
    description { Faker::Lorem.word }
    price { Faker::Number.number(100) }
    cost { Faker::Number.number(100) }
  end
end
