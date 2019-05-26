require 'update_db'

class Api::V1::ArrivalsController < ApplicationController

  def find
    station = Platform.find_by(code: params["code"])
    alt_station = Platform.find_by(code: station.alt_code)
    if alt_station
      handle_arrivals_request(station)
      handle_arrivals_request(alt_station)
      render json: Arrival.where(platform_id: [station.id, alt_station.id])
    else
      handle_arrivals_request(station)
      render json: Arrival.where(platform_id: station.id)
    end

  end

  private

  def arrivals_params
    params.permit(:code)
  end

  def handle_arrivals_request(station)

    puts "$$$$$$$$$$$$$$$$$ STATION:#{station.code}"

    def update_arrivals(station)
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

    if !station.arrivals_updated
      update_arrivals(station)
      puts "/////////////////////////////////NEVER BEEN UPDATED"
      return station.arrivals
    elsif DateTime.now.to_time - station.arrivals_updated.to_time > 20
      station.arrivals.destroy_all
      update_arrivals(station)
      puts "/////////////////////////////////OVER 20 SECONDS OLD"
      return station.arrivals
    else
      puts "/////////////////////////////////FRESH ARRIVALS"
      return station.arrivals
    end
  end

end
