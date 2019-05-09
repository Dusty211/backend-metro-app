class Line < ApplicationRecord
  has_many :platform_lines
  has_many :platforms, through: :platform_lines
end
