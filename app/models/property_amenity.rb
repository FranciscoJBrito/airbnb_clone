# PropertyAmenity model is a join table between the Property and Amenity models.
# It has a many-to-many relationship with both models.
# It belongs to a property and an amenity.
# It is used to store the amenities that a property has.
class PropertyAmenity < ApplicationRecord
  belongs_to :property
  belongs_to :amenity
end
