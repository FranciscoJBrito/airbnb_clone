require 'rails_helper'

RSpec.describe Reservation, type: :model do

  # Create a user to associate with the property
  let(:user) { FactoryBot.create(:user) }

  # Create a property to test
  let(:property) { FactoryBot.create(:property) }

  # Create a reservation with the user and property
  let(:reservation) { FactoryBot.create(:reservation, user: user, property: property) }

  describe 'validations' do
    subject { reservation }

    it 'should validate presence of checking_date' do
      reservation.checking_date = nil
      reservation.valid?
      expect(reservation.errors[:checking_date]).to include("can't be blank")
    end

    it 'should validate presence of checkout_date' do
      reservation.checkout_date = nil
      reservation.valid?
      expect(reservation.errors[:checkout_date]).to include("can't be blank")
    end
  end
end
