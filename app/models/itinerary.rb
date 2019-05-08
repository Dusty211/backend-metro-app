class Itinerary < ApplicationRecord
  has_many :arrivals, dependent: :destroy
  has_many :platforms, dependent: :destroy
end
