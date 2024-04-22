require 'rails_helper'

RSpec.describe Amenity, type: :model do
  let(:amenity) { FactoryBot.create(:amenity) }

  describe 'validations' do
    subject { amenity }
    it 'should validate presence of name' do
      amenity.name = nil
      amenity.valid?
      expect(amenity.errors[:name]).to include("can't be blank")
    end

    it 'should validate presence of description' do
      amenity.description = nil
      amenity.valid?
      expect(amenity.errors[:description]).to include("can't be blank")
    end
  end
end
