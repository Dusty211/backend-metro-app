class Itinerary < ApplicationRecord
  has_many :arrivals, dependent: :destroy
end
