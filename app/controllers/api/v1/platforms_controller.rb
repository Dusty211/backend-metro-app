class Api::V1::PlatformsController < ApplicationController

  def index #render all platforms for station selection in front end
    render json: Platform.all
  end

end
