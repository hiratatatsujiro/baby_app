FactoryBot.define do
  factory :medical_comment do
    content            { Faker::Lorem.sentence }
    association :user
    association :medical
    association :child
  end
end