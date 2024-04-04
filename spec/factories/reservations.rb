FactoryBot.define do
  factory :reservation do
    user { FactoryBot.create(:user) }
    property { FactoryBot.create(:property) }
    checking_date { Faker::Date.between(from: 2.days.ago, to: Date.today)}
    checkout_date { Faker::Date.between(from: Date.today, to: 2.days.from_now) }
  end
end
