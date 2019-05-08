class Platform < ApplicationRecord
  has_many :itineraries, dependent: :destroy
  has_many :arrivals, dependent: :destroy
  has_many :lines, dependent: :destroy
  has_one :address, dependent: :destroy
end
