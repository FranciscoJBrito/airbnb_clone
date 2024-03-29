require 'rails_helper'

RSpec.describe Property, type: :model do

  # Create a user to associate with the property
  let(:user) { FactoryBot.create(:user) }

  # Create a property to test
  let(:property) { FactoryBot.create(:property) }


  describe 'model validations' do
      subject { property }

      it 'should validate presence of name' do
        property.name = nil
        property.valid?
        expect(property.errors[:name]).to include("can't be blank")
      end

      it 'should validate presence of headline' do
        property.headline = nil
        property.valid?
        expect(property.errors[:headline]).to include("can't be blank")
      end

      it 'should validate presence of description' do
        property.description = nil
        property.valid?
        expect(property.errors[:description]).to include("can't be blank")
      end

      it 'should validate presence of address_1' do
        property.address_1 = nil
        property.valid?
        expect(property.errors[:address_1]).to include("can't be blank")
      end

      it 'should validate presence of address_2' do
        property.address_2 = nil
        property.valid?
        expect(property.errors[:address_2]).to include("can't be blank")
      end

      it 'should validate presence of city' do
        property.city = nil
        property.valid?
        expect(property.errors[:city]).to include("can't be blank")
      end

      it 'should validate presence of state' do
        property.state = nil
        property.valid?
        expect(property.errors[:state]).to include("can't be blank")
      end

      it 'should validate presence of country' do
        property.country = nil
        property.valid?
        expect(property.errors[:country]).to include("can't be blank")
      end
  end

  describe 'methods' do
    it 'should update average rating' do
      reviews = FactoryBot.create_list(:review, 3, property: property)
      expected_average_rating = reviews.map(&:final_rating).sum / reviews.length.to_f
      expect(property.average_final_rating.round(2)).to eq(expected_average_rating.round(2))
    end
  end
end
