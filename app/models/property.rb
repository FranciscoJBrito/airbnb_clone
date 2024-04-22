# Properties model to store the property details and validations
class Property < ApplicationRecord
  validates :name, presence: true
  validates :headline, presence: true
  validates :description, presence: true
  validates :address_1, presence: true # rubocop:disable Naming/VariableNumber
  validates :address_2, presence: true # rubocop:disable Naming/VariableNumber
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
  monetize :price_cents, allow_nil: true
  has_many_attached :images
  has_many :reviews, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_users, through: :wishlists, source: :user, dependent: :destroy

  has_many :reservations, dependent: :destroy
  has_many :reserved_users, through: :reservations, source: :user, dependent: :destroy

  has_rich_text :description

  def update_average_rating
    average_rating = reviews.average(:final_rating)
    update_column(:average_final_rating, average_rating) # rubocop:disable Rails/SkipsModelValidations
  end

  def average_cleanliness_rating
    reviews.average(:cleanliness_rating).to_f.round(1)
  end

  def average_accuracy_rating
    reviews.average(:accuracy_rating).to_f.round(1)
  end

  def average_checking_rating
    reviews.average(:cheking_rating).to_f.round(1)
  end

  def average_communication_rating
    reviews.average(:communication_rating).to_f.round(1)
  end

  def average_location_rating
    reviews.average(:location_rating).to_f.round(1)
  end

  def average_value_rating
    reviews.average(:value_rating).to_f.round(1)
  end

  def wishlisted_by?(user = nil)
    return false unless user

    wishlisted_users.include?(user)
  end

  def available_dates # rubocop:disable Metrics/AbcSize
    next_reservation = reservations.upcoming_reservations.first
    current_reservation = reservations.current_reservations.first
    if current_reservation.nil? && next_reservation.nil?
      date_range(Date.tomorrow, Date.tomorrow + 30.days)
    elsif current_reservation.nil?
      date_range(Date.tomorrow, next_reservation.checking_date)
    elsif next_reservation.nil?
      date_range(current_reservation.checkout_date, Date.tomorrow + 30.days)
    else
      date_range(current_reservation.checkout_date, next_reservation.checking_date)
    end
  end

  private

  def date_range(start_date, end_date)
    start_date.strftime('%e %b')..end_date.strftime('%e %b')
  end
end
