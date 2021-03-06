class Platform < ApplicationRecord
  has_many :platform_lines
  has_many :lines, through: :platform_lines
  has_one :address, dependent: :destroy
  has_many :arrivals, dependent: :destroy
end
