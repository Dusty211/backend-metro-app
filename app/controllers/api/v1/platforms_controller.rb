class Api::V1::PlatformsController < ApplicationController

  def source
    render json: Platform.all
  end

  # def destination
  #   render json: DestinationPlatform.all
  # end

end
