class Line < ApplicationRecord
  has_many :platforms, through: :platform_lines
end
