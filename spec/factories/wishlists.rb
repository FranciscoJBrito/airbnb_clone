FactoryBot.define do
  factory :wishlist do
    user { FactoryBot.create(:user) }
    property { FactoryBot.create(:property) }
  end
end
