FactoryBot.define do
  factory :tech do
    title { Faker::Lorem.word }
    category { Faker::Lorem.word }
    description { Faker::Lorem.word }
    price { Faker::Number.number(100) }
    cost { Faker::Number.number(100) }
  end
end
