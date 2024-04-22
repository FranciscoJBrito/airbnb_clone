# User model to store the user details and validations.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :address_1, presence: true # rubocop:disable Naming/VariableNumber
  validates :address_2, presence: true # rubocop:disable Naming/VariableNumber
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true

  has_one_attached :picture

  has_many :wishlists, dependent: :destroy
  has_many :wishlisted_properties, through: :wishlists, source: :property, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_many :reserved_properties, through: :reservations, source: :property, dependent: :destroy
end
