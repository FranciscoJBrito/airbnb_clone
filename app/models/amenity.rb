# Amneity model to store the amenities of the properties
class Amenity < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
end
