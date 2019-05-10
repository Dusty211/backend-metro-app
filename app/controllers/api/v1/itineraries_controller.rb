require 'update_db'

class Api::V1::ItinerariesController < ApplicationController
  def find
    render json: Itinerary.where(
      source_code: itinerary_params[:source_code]).where(
        destination_code: itinerary_params[:destination_code])
  end
end

private

def itinerary_params
  params.permit(:source_code, :destination_code)
end
