require 'update_db'

class Api::V1::ArrivalsController < ApplicationController

  def find
    station = Platform.find_by(code: params["code"]) #takes the one URL param
    alt_station = Platform.find_by(code: station.alt_code) #Only some Platforms have "alt_code"
    if alt_station #true if station has an "alt_code"
      handle_arrivals_request(station) #platform1
      handle_arrivals_request(alt_station) #platform2
      render json: [
        {
          platform_id: station.id,
          platform_arrivals: Arrival.where(platform_id: station.id)
        }, {
          platform_id: alt_station.id,
          platform_arrivals: Arrival.where(platform_id: alt_station.id)
        }
      ]
    else #if the station only has one platform
      handle_arrivals_request(station)
      render json: [
        {
          platform_id: station.id,
          platform_arrivals: Arrival.where(platform_id: station.id)
        }
      ]
    end

  end

  private

  def arrivals_params
    params.permit(:code)
  end

  def handle_arrivals_request(station) #Returns data < 20sec old, or fetches new data

    puts "$$$$$$$$$$$$$$$$$ STATION:#{station.code}"

    def update_arrivals(station) #Only runs if data is < 20sec or non-existant
      color = {
        "GR" => "green",
        "BL" => "blue",
        "SV" => "silver",
        "RD" => "red",
        "OR" => "orange",
        "YL" => "yellow"
      }
      UpdateDb.arrivals_data(station.code).each do |arrival|
        new_arrival = Arrival.create(
          cars: arrival["Car"],
          destination: arrival["DestinationName"],
          line: color[arrival["Line"]],
          minutes: arrival["Min"]
         )
         station.arrivals << new_arrival
      end
      station.update!(arrivals_updated: DateTime.now)
    end

    if !station.arrivals_updated #Checks to see if there is anything in
                                 #the "arrivals_updated" column of this Platform
      update_arrivals(station)
      puts "/////////////////////////////////NEVER BEEN UPDATED"
      return station.arrivals
    elsif DateTime.now.to_time - station.arrivals_updated.to_time > 20 #Not fresh data?
      station.arrivals.destroy_all
      update_arrivals(station)
      puts "/////////////////////////////////OVER 20 SECONDS OLD"
      return station.arrivals
    else #Data is less than 20 sec old
      puts "/////////////////////////////////FRESH ARRIVALS"
      return station.arrivals
    end
  end

end
