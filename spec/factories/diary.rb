FactoryBot.define do
  factory :diary do
    title           { Faker::Name.name }
    text            { Faker::Lorem.sentence }
    day             { Faker::Date.backward }
    association :user
    
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/sample1.png'), filename: 'sample1.png')
    end
  end
end