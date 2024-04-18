class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :checking_date, presence: true
  validates :checkout_date, presence: true

  scope :upcoming_reservations, -> { where('checking_date > ?', Date.today).order(:checking_date) }
  scope :current_reservations, -> { where("checkout_date > ?", Date.today).where("checking_date < ?", Date.today).order(:checkout_date) }
end
