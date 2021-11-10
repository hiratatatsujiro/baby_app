FactoryBot.define do
  factory :user do
    name                { Faker::Name.name}
    email               { Faker::Internet.free_email}
    password            { Faker::Internet.password }
    encrypted_password  { password }
    prefectures_id      { Faker::Number.between(from: 2, to: 48) }
    city                { Faker::Lorem.sentence }
    house_number        { 111 }
  end
end
