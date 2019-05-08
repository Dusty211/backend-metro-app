class Platform < ApplicationRecord
  belongs_to :itinerary
  has_many :lines, dependent: :destroy
  has_one :address, dependent: :destroy
end
