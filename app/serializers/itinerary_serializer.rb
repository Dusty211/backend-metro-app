class ItinerarySerializer < ActiveModel::Serializer
  attributes :source_code, :destination_code, :miles, :time, :peak_fare, :off_peak_fare, :senior_fare

end
