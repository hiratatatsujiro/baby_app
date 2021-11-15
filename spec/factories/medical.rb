FactoryBot.define do
  factory :medical do
    day               { Faker::Date.backward }
    hospital          { Faker::Name.name }
    name_id           { Faker::Number.between(from: 2, to: 3) }
    drug_id           { Faker::Number.between(from: 2, to: 3) }
    memo              { Faker::Lorem.sentence }
    association :child
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end