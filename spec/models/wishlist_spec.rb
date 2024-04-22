require 'rails_helper'

RSpec.describe Wishlist, type: :model do
  # Create a user to associate with the review
  let(:user) { FactoryBot.create(:user) }

  # Create a property to associate with the review
  let(:property) { FactoryBot.create(:property) }

  # Create a wishlist with the user and property
  let(:wishlist) { FactoryBot.create(:wishlist, user:, property:) }

  describe 'associations' do
    it 'should belong to a user' do
      expect(wishlist.user).to eq(user)
    end

    it 'should belong to a property' do
      expect(wishlist.property).to eq(property)
    end
  end
end
