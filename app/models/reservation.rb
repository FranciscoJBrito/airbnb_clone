# Reservation model to store the reservation details and validations
class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :checking_date, presence: true
  validates :checkout_date, presence: true

  scope :upcoming_reservations, -> { where('checking_date > ?', Time.zone.today).order(:checking_date) }
  scope :current_reservations, lambda {
                                 where('checking_date < ? AND checkout_date > ?', Time.zone.today, Time.zone.today)
                                   .order(:checking_date)
                               }
end
