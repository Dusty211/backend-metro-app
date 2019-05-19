class Api::V1::PlatformsController < ApplicationController

  def source
    render json: SourcePlatform.all
  end

  def destination
    render json: DestinationPlatform.all
  end

end
