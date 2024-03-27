require 'rails_helper'

RSpec.describe Property, type: :model do
  describe 'validations' do
    it 'should validate presence of name' do
      property = Property.new(name: nil)
      expect(property.valid?).to be(false)
    end
    it 'should validate presence of headline' do
      property = Property.new(headline: nil)
      expect(property.valid?).to be(false)
    end
    it 'should validate presence of description' do
      property = Property.new(description: nil)
      expect(property.valid?).to be(false)
    end
    it 'should validate presence of address_1' do
      property = Property.new(address_1: nil)
      expect(property.valid?).to be(false)
    end
    it 'should validate presence of address_2' do
      property = Property.new(address_2: nil)
      expect(property.valid?).to be(false)
    end
    it 'should validate presence of city' do
      property = Property.new(city: nil)
      expect(property.valid?).to be(false)
    end
    it 'should validate presence of state' do
      property = Property.new(state: nil)
      expect(property.valid?).to be(false)
    end
    it 'should validate presence of country' do
      property = Property.new(country: nil)
      expect(property.valid?).to be(false)
    end
  end
end
