FactoryBot.define do
  factory :review do
    property { FactoryBot.create(:property) }
    user { FactoryBot.create(:user) }
    content { Faker::Lorem.paragraph(sentence_count: 10) }
    cleanliness_rating { (1..5).to_a.sample }
    accuracy_rating { (1..5).to_a.sample }
    cheking_rating { (1..5).to_a.sample }
    communication_rating { (1..5).to_a.sample }
    location_rating { (1..5).to_a.sample }
    value_rating { (1..5).to_a.sample }
  end
end
