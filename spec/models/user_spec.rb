require 'rails_helper'

RSpec.describe User, type: :model do
  # Create a user to test
  let(:user) { FactoryBot.create(:user) }

  describe 'validations' do
    subject { user }

    it 'should validate presence of name' do
      user.name = nil
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'should validate presence of address_1' do
      user.address_1 = nil
      user.valid?
      expect(user.errors[:address_1]).to include("can't be blank") # rubocop:disable Naming/VariableNumber
    end

    it 'should validate presence of address_2' do
      user.address_2 = nil
      user.valid?
      expect(user.errors[:address_2]).to include("can't be blank") # rubocop:disable Naming/VariableNumber
    end

    it 'should validate presence of city' do
      user.city = nil
      user.valid?
      expect(user.errors[:city]).to include("can't be blank")
    end

    it 'should validate presence of state' do
      user.state = nil
      user.valid?
      expect(user.errors[:state]).to include("can't be blank")
    end

    it 'should validate presence of country' do
      user.country = nil
      user.valid?
      expect(user.errors[:country]).to include("can't be blank")
    end
  end
end
