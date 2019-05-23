require 'update_db'

class Api::V1::ArrivalsController < ApplicationController

  def find
    station = SourcePlatform.find_by(code: params["code"])
    alt_station = SourcePlatform.find_by(code: params["alt_code"])
    if alt_station
      arrivals_arr(station)
      arrivals_arr(alt_station)
      render json: Arrival.where(platform_id: [station.id, alt_station.id])
    else
      arrivals_arr(station)
      render json: Arrival.where(platform_id: station.id)
    end

  end

  private

  def arrivals_params
    params.permit(:code)
  end

  def arrivals_arr(station)

    def update_arrivals(station)
      color = {
        "GR" => "green",
        "BL" => "blue",
        "SV" => "silver",
        "RD" => "red",
        "OR" => "blue",
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
    elsif DateTime.now.to_time - station.arrivals_updated.to_time > 60
      station.arrivals.destroy_all
      update_arrivals(station)
      puts "/////////////////////////////////OVER 60 SECONDS OLD"
      return station.arrivals
    else
      puts "/////////////////////////////////FRESH ARRIVALS"
      return station.arrivals
    end
  end

end
