class ItinerarySerializer < ActiveModel::Serializer
  attributes :source_code, :destination_code, :miles, :time, :peak_fare, :off_peak_fare, :senior_fare#, :source_platform, :destination_platform

  # def source_platform
  #   {name: self.object.source_platform.name,
  #    address: {
  #      street: self.object.source_platform.address.street,
  #      city: self.object.source_platform.address.city,
  #      state: self.object.source_platform.address.state,
  #      zip: self.object.source_platform.address.zip,
  #    }
  #    lines: self.object.source_platform.lines.map do |line|
  #      {color: line.color,
  #       code: line.code
  #     }
  #    end
  # end

  # def destination_platform
  # end

end
