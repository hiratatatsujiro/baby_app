FactoryBot.define do
  factory :child do
    name           { Faker::Name.name }
    gender_id      { Faker::Number.between(from: 2, to: 3) }
    birthday       { Faker::Date.backward }
    association :user
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end