class ItinerarySerializer < ActiveModel::Serializer
  attributes :source_code, :destination_code, :miles, :time, :peak_fare, :off_peak_fare, :senior_fare, :source_platform, :destination_platform

  def source_platform
    source_platform = self.object.platforms.find_by(type: "SourcePlatform")
      {name: source_platform.name,
      address: {
        street: source_platform.address.street,
        city: source_platform.address.city,
        state: source_platform.address.state,
        zip: source_platform.address.zip
      },
      lines: source_platform.lines.map do |line|
        {color: line.color,
        code: line.code}
      end
      }
  end

  def destination_platform
    destination_platform = self.object.platforms.find_by(type: "DestinationPlatform")
      {name: destination_platform.name,
      address: {
        street: destination_platform.address.street,
        city: destination_platform.address.city,
        state: destination_platform.address.state,
        zip: destination_platform.address.zip
      },
      lines: destination_platform.lines.map do |line|
        {color: line.color,
        code: line.code}
      end
      }
  end

end
