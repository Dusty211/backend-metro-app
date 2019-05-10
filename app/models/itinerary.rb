class Itinerary < ApplicationRecord
  has_many :platform_itineraries
  has_many :platforms, through: :platform_itineraries
end
