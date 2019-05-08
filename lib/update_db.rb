require 'station_converter'

class UpdateDb

  include StationConverter

  def initialize(source_code, destination_code)
    @source = source_code
    @destination = destination_code
  end

  def test_arrivals
    return_data(arrivals_url)
  end

  def test_itinerary
    return_data(itinerary_url)
  end

  def source_name
    self.to_station_name(@source)
  end

  def destination_name
    self.to_station_name(@destination)
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

  def api_key
    return Rails.application.credentials.wmata[:primary_key]
  end

  def arrivals_url
    return "https://api.wmata.com/StationPrediction.svc/json/GetPrediction/#{@source}?api_key=#{api_key}"
  end

  def itinerary_url
    return "https://api.wmata.com/Rail.svc/json/jSrcStationToDstStationInfo?api_key=#{api_key}&FromStationCode=#{@source}&ToStationCode=#{@destination}"
  end

  # Dev use:
  # def stations_url
  #   return "https://api.wmata.com/Rail.svc/json/jStations?api_key=#{api_key}"
  # end

  def return_data(url)
    response = RestClient.get(url)
    return JSON.parse(response)
  end

end
