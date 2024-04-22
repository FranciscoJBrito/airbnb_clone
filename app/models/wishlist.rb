# Wishlist model to store the wishlist details and validations.
class Wishlist < ApplicationRecord
  belongs_to :user
  belongs_to :property
end
