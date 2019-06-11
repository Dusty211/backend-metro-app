class IncidentUpdate < ApplicationRecord
  has_many :incidents, dependent: :destroy
end
