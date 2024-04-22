FactoryBot.define do
  factory :reservation do
    user { FactoryBot.create(:user) }
    property { FactoryBot.create(:property) }
    checking_date { Faker::Date.between(from: 30.days.ago, to: Time.zone.today + 30.days) }
    checkout_date { Faker::Date.between(from: Time.zone.today + 30.days, to: Date.tomorrow + 60.days) }
  end
end
