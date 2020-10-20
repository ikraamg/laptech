FactoryBot.define do
  factory :user do
    username { Faker::Lorem.word }
    password { "password" }
    email { Faker::Internet.email }
    admin { false }
  end
end
