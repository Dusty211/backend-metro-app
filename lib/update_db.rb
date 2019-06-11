
class UpdateDb

  def initialize(source_code, destination_code)
    @source = source_code
    @destination = destination_code
  end

  def self.seed_lines
    lines = %w(GR BL SV RD OR YL)
    color = {
      "GR" => "green",
      "BL" => "blue",
      "SV" => "silver",
      "RD" => "red",
      "OR" => "orange",
      "YL" => "yellow"
     }
    lines.each do |line|
      Line.create(code: line, color: color[line])
    end
  end

  def self.seed_platforms_addresses_associate_lines
    platforms_clone = all_platforms.clone
    platforms_clone.each do |platform|
        new_platform = Platform.create(
          code: platform["Code"],
          name: platform["Name"],
          alt_code: platform["StationTogether1"],
          lat: platform["Lat"],
          lon: platform["Lon"]
        )
      platform_address = Address.create(
        street: platform["Address"]["Street"],
        city: platform["Address"]["City"],
        state: platform["Address"]["State"],
        zip: platform["Address"]["Zip"]
      )
      new_platform.address = platform_address
      lines = []
      [1,2,3,4].each do |i|
        #shovel existing line colors into lines variable
        platform["LineCode#{i}"] && lines << platform["LineCode#{i}"]
      end
      #if station has multiple platforms
      if platform["StationTogether1"] != ""
        #find alt platform and store in variable
        alt_platform = platforms_clone.find do |cloned|
          cloned["Code"] == platform["StationTogether1"]
        end
        [1,2,3,4].each do |i|
          #shovel existing line colors from second platform into lines variable
          alt_platform["LineCode#{i}"] && lines << alt_platform["LineCode#{i}"]
        end
      end
      lines.sort!
      #associate correct lines with the created db platform
      lines.each do |line|
        new_platform.lines << Line.find_by(code: line)
      end
    end
  end

  def self.seed_itineraries
    itineraries_clone = all_itinerary_data.clone
      itineraries_clone.each do |itinerary|
        new_itinerary = Itinerary.create(
          source_code: itinerary["SourceStation"],
          destination_code: itinerary["DestinationStation"],
          miles: itinerary["CompositeMiles"],
          time: itinerary["RailTime"],
          peak_fare: itinerary["RailFare"]["PeakTime"],
          off_peak_fare: itinerary["RailFare"]["OffPeakTime"],
          senior_fare: itinerary["RailFare"]["SeniorDisabled"]
        )
      end
  end


  def self.arrivals_data(code)
    return_data(arrivals_url(code))["Trains"]
  end

  def self.incidents_data
    return_data(incidents_url)["Incidents"]
  end


  private

  def self.api_key
    return Rails.application.credentials.wmata[:primary_key]
  end

  def self.arrivals_url(code)
    return "https://api.wmata.com/StationPrediction.svc/json/GetPrediction/#{code}?api_key=#{api_key}"
  end

  def self.incidents_url
    return "https://api.wmata.com/Incidents.svc/json/Incidents?api_key=#{api_key}"
  end

  #Dev use (seeds.rb):
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
