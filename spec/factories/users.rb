FactoryBot.define do
  factory :user do
    name                { Faker::Name.name}
    email               { Faker::Internet.free_email}
    encrypted_password  { Faker::Internet.password }
    prefectures_id      | integer  | null: false |
    city                | string   | null: false |
    house_number        | string   | null: false |   
  end
end
