
class Api::V1::ItinerariesController < ApplicationController
  def find #Render specific route for route info in front end
    render json: Itinerary.where(
      source_code: itinerary_params[:source_code]).where(
        destination_code: itinerary_params[:destination_code])[0]
  end

private

  def itinerary_params
    params.permit(:source_code, :destination_code)
  end
end
