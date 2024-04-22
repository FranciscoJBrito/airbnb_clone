require 'rails_helper'

RSpec.describe Review, type: :model do
  # Create a user to associate with the review
  let(:user) { FactoryBot.create(:user) }

  # Create a property to associate with the review
  let(:property) { FactoryBot.create(:property) }

  # Create a review to test
  let(:review) { FactoryBot.create(:review, property:, user:) }

  describe 'validations' do
    it 'should validate the presence of the content' do
      review.content = nil
      review.valid?
      expect(review.errors.messages).to have_key(:content)
    end
    it 'should validate the cleanliness_rating is a number' do
      review.cleanliness_rating = nil
      review.valid?
      expect(review.errors.messages).to have_key(:cleanliness_rating)
    end
    it 'should validate the accuracy_rating is a number' do
      review.accuracy_rating = nil
      review.valid?
      expect(review.errors.messages).to have_key(:accuracy_rating)
    end
    it 'should validate the cheking_rating is a number' do
      review.cheking_rating = nil
      review.valid?
      expect(review.errors.messages).to have_key(:cheking_rating)
    end
    it 'should validate the communication_rating is a number' do
      review.communication_rating = nil
      review.valid?
      expect(review.errors.messages).to have_key(:communication_rating)
    end
    it 'should validate the location_rating is a number' do
      review.location_rating = nil
      review.valid?
      expect(review.errors.messages).to have_key(:location_rating)
    end
    it 'should validate the value_rating is a number' do
      review.value_rating = nil
      review.valid?
      expect(review.errors.messages).to have_key(:value_rating)
    end
  end

  describe 'associations' do
    it 'should belong to a user' do
      expect(review.user).to eq(user)
    end

    it 'should belong to a property' do
      expect(review.property).to eq(property)
    end
  end

  describe 'callbacks' do
    it 'should update the final rating' do
      expected_final_rating = (review.cleanliness_rating +
                               review.accuracy_rating +
                               review.cheking_rating +
                               review.communication_rating +
                               review.location_rating +
                               review.value_rating).to_f / 6.0

      expect(review.final_rating.to_f.round(2)).to eq(expected_final_rating.round(2))
    end
  end
end
