require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    review = Review.new
    it 'should validate the presence of the content' do
      review.valid?
      expect(review.errors.messages).to have_key(:content)
    end
    it 'should validate the cleanliness_rating is a number' do
      review.valid?
      expect(review.errors.messages).to have_key(:cleanliness_rating)
    end
    it 'should validate the accuracy_rating is a number' do
      review.valid?
      expect(review.errors.messages).to have_key(:accuracy_rating)
    end
    it 'should validate the cheking_rating is a number' do
      review.valid?
      expect(review.errors.messages).to have_key(:cheking_rating)
    end
    it 'should validate the communication_rating is a number' do
      review.valid?
      expect(review.errors.messages).to have_key(:communication_rating)
    end
    it 'should validate the location_rating is a number' do
      review.valid?
      expect(review.errors.messages).to have_key(:location_rating)
    end
    it 'should validate the value_rating is a number' do
      review.valid?
      expect(review.errors.messages).to have_key(:value_rating)
    end
  end

  describe 'associations' do
    it 'should belong to a user' do
      user = User.create(email: Faker::Internet.email, password: Faker::Internet.password)
      review = Review.new(user: user)
      expect(review.user).to eq(user)
    end

    it 'should belong to a property' do
      property = Property.create(name: Faker::Company.name, headline: Faker::Company.catch_phrase, description: Faker::Lorem.paragraph, address_1: Faker::Address.street_address, address_2: Faker::Address.secondary_address, city: Faker::Address.city, state: Faker::Address.state, country: Faker::Address.country, price: Faker::Commerce.price)
      review = Review.new(property: property)
      expect(review.property).to eq(property)
    end
  end
end
