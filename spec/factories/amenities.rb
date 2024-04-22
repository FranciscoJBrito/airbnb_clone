FactoryBot.define do
  factory :amenity do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence }
  end
end
