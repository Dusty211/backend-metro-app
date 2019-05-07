
class UpdateDb

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

  def return_data(url)
    response = RestClient.get(url)
    return JSON.parse(response)
  end

end
