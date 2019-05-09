require 'station_converter'

class UpdateDb

  extend StationConverter

  def initialize(source_code, destination_code)
    @source = source_code
    @destination = destination_code
  end
  #return_data is now a class method
  def test_arrivals
    return_data(arrivals_url)
  end
  #return_data is now a class method
  def itinerary_data
    return_data(itinerary_url)
  end

  #won't work now because StationConverter is extended instead of included
  def source_name
    self.to_station_name(@source)
  end
  #won't work now because StationConverter is extended instead of included
  def destination_name
    self.to_station_name(@destination)
  end

  def self.seed_source_platforms
    all_platforms.each do |platform|
      byebug
    end
  end


  # Dev use:
  # def print_converter
  #   output = {}
  #     return_data(stations_url)["Stations"].each do |station|
  #       output.merge!("#{station["Name"]}" => "#{station["Code"]}")
  #     end
  #   return output
  # end

  private

  def self.api_key
    return Rails.application.credentials.wmata[:primary_key]
  end

  def arrivals_url
    return "https://api.wmata.com/StationPrediction.svc/json/GetPrediction/#{@source}?api_key=#{api_key}"
  end

  def itinerary_url
    return "https://api.wmata.com/Rail.svc/json/jSrcStationToDstStationInfo?api_key=#{api_key}&FromStationCode=#{@source}&ToStationCode=#{@destination}"
  end

  #Dev use:
  def self.all_itinerary_url
    return "https://api.wmata.com/Rail.svc/json/jSrcStationToDstStationInfo?api_key=#{api_key}"
  end

  def self.stations_url
    return "https://api.wmata.com/Rail.svc/json/jStations?api_key=#{api_key}"
  end

  def self.all_itinerary_data
    return_data(all_itinerary_url)["StationToStationInfos"]
  end

  def self.all_platforms
    return_data(stations_url)["Stations"]
  end

  ##########


  def self.return_data(url)
    response = RestClient.get(url)
    return JSON.parse(response)
  end

end
